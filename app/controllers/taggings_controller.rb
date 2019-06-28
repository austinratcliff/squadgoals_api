class TaggingsController < ApplicationController
  before_action :set_tagging, only: [:show, :update, :destroy]

  def index
    @taggings = Tagging.all

    render json: @taggings
  end

  def show
    render json: @tagging
  end

  def create
    @tagging = Tagging.new(tagging_params)

    if @tagging.save
      render json: @tagging, status: :created, location: @tagging
    else
      render json: @tagging.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tagging.update(tagging_params)
      render json: @tagging
    else
      render json: @tagging.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tagging.destroy
  end

  private
    def set_tagging
      @tagging = Tagging.find(params[:id])
    end

    def tagging_params
      params.require(:tagging).permit(:goal_id, :tag_id)
    end
end
