class ProjectGoalsController < ApplicationController
  before_action :set_project_goal, only: [:show, :update, :destroy]

  def index
    @project_goals = ProjectGoal.all

    render json: @project_goals
  end

  def show
    render json: @project_goal
  end

  def create
    @project_goal = ProjectGoal.new(project_goal_params)

    if @project_goal.save
      render json: @project_goal, status: :created, location: @project_goal
    else
      render json: @project_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project_goal.update(project_goal_params)
      render json: @project_goal
    else
      render json: @project_goal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_goal.destroy
  end

  private
    def set_project_goal
      @project_goal = ProjectGoal.find(params[:id])
    end

    def project_goal_params
      params.require(:project_goal).permit(:project_id, :content, :by_when, :is_private)
    end
end
