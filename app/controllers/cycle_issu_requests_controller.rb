class CycleIssuRequestsController < ApplicationController
  before_action :set_cycle_issu_request, only: [:show, :edit, :update, :destroy]

  # GET /cycle_issu_requests
  # GET /cycle_issu_requests.json
  def index
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
    @cycle_issu_request = CycleIssuRequest.new(cycle_issu_request_params)

    respond_to do |format|
      if @cycle_issu_request.save
        format.html { redirect_to @cycle_issu_request, notice: 'Cycle issue request was successfully created.' }
        format.json { render :show, status: :created, location: @cycle_issu_request }
      else
        format.html { render :new }
        format.json { render json: @cycle_issu_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycle_issu_requests/1
  # PATCH/PUT /cycle_issu_requests/1.json
  def update
    respond_to do |format|
      if @cycle_issu_request.update(cycle_issu_request_params)
        format.html { redirect_to @cycle_issu_request, notice: 'Cycle issue request was successfully updated.' }
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
      format.html { redirect_to cycle_issu_requests_url, notice: 'Cycle issue request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def get_ride
  end

  def cycle_dashboard
    @cycle_issu_requests = CycleIssuRequest.all
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
