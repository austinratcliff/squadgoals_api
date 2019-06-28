class RequestStatusesController < ApplicationController
  before_action :set_request_status, only: [:show, :update, :destroy]

  def index
    @request_statuses = RequestStatus.all

    render json: @request_statuses
  end

  def show
    render json: @request_status
  end

  def create
    @request_status = RequestStatus.new(request_status_params)

    if @request_status.save
      render json: @request_status, status: :created, location: @request_status
    else
      render json: @request_status.errors, status: :unprocessable_entity
    end
  end

  def update
    if @request_status.update(request_status_params)
      render json: @request_status
    else
      render json: @request_status.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @request_status.destroy
  end

  private
    def set_request_status
      @request_status = RequestStatus.find(params[:id])
    end

    def request_status_params
      params.require(:request_status).permit(:name)
    end
end
