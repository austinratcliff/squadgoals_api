class VisionsController < ApplicationController
  before_action :set_vision, only: [:show, :update, :destroy]

  def index
    @visions = Vision.all

    render json: @visions
  end

  def show
    render json: @vision
  end

  def create
    @vision = Vision.new(vision_params)

    if @vision.save
      render json: @vision, status: :created, location: @vision
    else
      render json: @vision.errors, status: :unprocessable_entity
    end
  end

  def update
    if @vision.update(vision_params)
      render json: @vision
    else
      render json: @vision.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vision.destroy
  end

  private
    def set_vision
      @vision = Vision.find(params[:id])
    end

    def vision_params
      params.require(:vision).permit(:user_id, :statement, :timeframe)
    end
end
