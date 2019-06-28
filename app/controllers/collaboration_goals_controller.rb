class CollaborationGoalsController < ApplicationController
  before_action :set_collaboration_goal, only: [:show, :update, :destroy]

  def index
    @collaboration_goals = CollaborationGoal.all

    render json: @collaboration_goals
  end

  def show
    render json: @collaboration_goal
  end

  def create
    @collaboration_goal = CollaborationGoal.new(collaboration_goal_params)

    if @collaboration_goal.save
      render json: @collaboration_goal, status: :created, location: @collaboration_goal
    else
      render json: @collaboration_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @collaboration_goal.update(collaboration_goal_params)
      render json: @collaboration_goal
    else
      render json: @collaboration_goal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collaboration_goal.destroy
  end

  private
    def set_collaboration_goal
      @collaboration_goal = CollaborationGoal.find(params[:id])
    end

    def collaboration_goal_params
      params.require(:collaboration_goal).permit(:project_id, :requester_goal_id, :requestee_goal_id)
    end
end
