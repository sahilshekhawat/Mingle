class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, :if => proc {|c| request.path_parameters[:format] == 'json'}
  # GET /travels
  # GET /travels.json
  def index
    @travels = Travel.all
    @hash = Gmaps4rails.build_markers(@travels) do |travel, markerfrom|
      markerfrom.lat travel.flatitude
      markerfrom.lng travel.flongitude
    end
    @hash = Gmaps4rails.build_markers(@travels) do |travel, markerto|
      markerto.lat travel.tlatitude
      markerto.lng travel.tlongitude
    end
  end

  # GET /travels/1
  # GET /travels/1.json
  def show
  end

  # GET /travels/new
  def new
    @travel = Travel.new
  end

  # GET /travels/1/edit
  def edit
    if @travel.user_id != current_user.id
      flash[:error] = "Error: Travel is not yours"
      redirect_to '/' and return
    end
  end

  # POST /travels
  # POST /travels.json
  def create
    @travel = Travel.new(travel_params)
    @travel.user_id = current_user.id
    respond_to do |format|
      if @travel.save
        format.html { redirect_to @travel, notice: 'Travel was successfully created.' }
        format.json { render :show, status: :created, location: @travel }
      else
        format.html { render :new }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travels/1
  # PATCH/PUT /travels/1.json
  def update
    if @travel.user_id != current_user.id
      redirect_to '/' and return
    end
    @travel.user_id = current_user.id
    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to @travel, notice: 'Travel was successfully edited.' }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.json
  def destroy
    if @travel.user_id != current_user.id
      redirect_to '/' and return
    end
    @travel.destroy
    respond_to do |format|
      format.html { redirect_to travels_url, notice: 'Travel was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def join
    travel = Travel.find(params[:id])
    if travel.collaborators.include? current_user.id
      travel.collaborators.delete current_user.id
    else
      travel.collaborators << current_user.id
    end
    travel.save!
    redirect_to "/travel"
  end

  def remove
    travel = Travel.find(params[:travel_id])
    user = User.find(params[:user_id])

    if travel.collaborators.include? user.id
      travel.collaborators.delete user.id
    else
      format.html { redirect_to travel, notice: "The person was never going -_-" }
    end
    
    travel.save!
    redirect_to "/travels/#{travel.id}"

  end

  def gmaps4rails_infowindow
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel
      @travel = Travel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_params
      params.require(:travel).permit(:tlatitude, :tlongitude, :flatitude, :flongitude, :from, :to, :datetime, :user_id, :medium)
    end
end
