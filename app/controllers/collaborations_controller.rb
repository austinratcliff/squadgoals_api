class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: [:show, :update, :destroy]

  def index
    @collaborations = Collaboration.all

    render json: @collaborations
  end

  def show
    render json: @collaboration
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)

    if @collaboration.save
      render json: @collaboration, status: :created, location: @collaboration
    else
      render json: @collaboration.errors, status: :unprocessable_entity
    end
  end

  def update
    if @collaboration.update(collaboration_params)
      render json: @collaboration
    else
      render json: @collaboration.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collaboration.destroy
  end

  private
    def set_collaboration
      @collaboration = Collaboration.find(params[:id])
    end

    def collaboration_params
      params.require(:collaboration).permit(:message, :requester_id, :requestee_id, :requester_goal_id, :requestee_goal_id, :request_status_id)
    end
end
