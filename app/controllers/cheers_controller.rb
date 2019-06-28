class CheersController < ApplicationController
  before_action :set_cheer, only: [:show, :update, :destroy]

  def index
    @cheers = Cheer.all

    render json: @cheers
  end

  def show
    render json: @cheer
  end

  def create
    @cheer = Cheer.new(cheer_params)

    if @cheer.save
      render json: @cheer, status: :created, location: @cheer
    else
      render json: @cheer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cheer.update(cheer_params)
      render json: @cheer
    else
      render json: @cheer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cheer.destroy
  end

  private
    def set_cheer
      @cheer = Cheer.find(params[:id])
    end

    def cheer_params
      params.require(:cheer).permit(:user_id, :goal_id)
    end
end
