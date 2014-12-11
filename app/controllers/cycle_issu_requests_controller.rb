class CycleIssuRequestsController < ApplicationController
  before_action :set_cycle_issu_request, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper
  # GET /cycle_issu_requests
  # GET /cycle_issu_requests.json
  def index
    if !current_user.admin?
      flash[:error] = "You ain't an admin."
      redirect_to '/choose/'
    end

    @cycle_issu_requests = CycleIssuRequest.all
  end

  # GET /cycle_issu_requests/1
  # GET /cycle_issu_requests/1.json
  def show
  end

  # GET /cycle_issu_requests/new
  def new
    @cycle_issu_request = CycleIssuRequest.new
  end

  # GET /cycle_issu_requests/1/edit
  def edit
  end

  # POST /cycle_issu_requests
  # POST /cycle_issu_requests.json
  def create
    to = Time.now + 5.hours
    if get_current_cycle_request.nil?
    @cycle_issu_request = CycleIssuRequest.new(:studentid => current_user.id, from: Time.now, :to => to, :approved => false)

    respond_to do |format|
      if @cycle_issu_request.save
        format.html { redirect_to '/dashboard', notice: 'Cycle issue request was successfully created.' }
        format.json { render :show, status: :created, location: @cycle_issu_request }
      else
        format.html { render :new }
        format.json { render json: @cycle_issu_request.errors, status: :unprocessable_entity }
      end
    end
    else
      flash[:error] = "Already requested for a bicycle"
      redirect_to '/dashboard'
    end
  end

  # PATCH/PUT /cycle_issu_requests/1
  # PATCH/PUT /cycle_issu_requests/1.json
  def update
    respond_to do |format|
      if @cycle_issu_request.update(cycle_issu_request_params)
        format.html { redirect_to '/dashboard', notice: 'Cycle issue request was successfully updated.' }
        format.json { render :show, status: :ok, location: @cycle_issu_request }
      else
        format.html { render :edit }
        format.json { render json: @cycle_issu_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycle_issu_requests/1
  # DELETE /cycle_issu_requests/1.json
  def destroy
    @cycle_issu_request.destroy
    respond_to do |format|
      format.html { redirect_to '/dashboard', notice: 'Cycle issue request was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def accept
    set_cycle_issu_request
    @cycle_issu_request.approved = true
    @cycle_issu_request.save!
    redirect_to '/cycle'
  end
  def reject
    set_cycle_issu_request
    @cycle_issu_request.approved = false
    @cycle_issu_request.save!
    redirect_to '/cycle'
  end
  def get_ride
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle_issu_request
      @cycle_issu_request = CycleIssuRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cycle_issu_request_params
      params.require(:cycle_issu_request).permit(:cycleid, :studentid, :to, :from)
    end
end
