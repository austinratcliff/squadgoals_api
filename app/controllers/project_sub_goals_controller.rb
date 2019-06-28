class ProjectSubGoalsController < ApplicationController
  before_action :set_project_sub_goal, only: [:show, :update, :destroy]

  def index
    @project_sub_goals = ProjectSubGoal.all

    render json: @project_sub_goals
  end

  def show
    render json: @project_sub_goal
  end

  def create
    @project_sub_goal = ProjectSubGoal.new(project_sub_goal_params)

    if @project_sub_goal.save
      render json: @project_sub_goal, status: :created, location: @project_sub_goal
    else
      render json: @project_sub_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project_sub_goal.update(project_sub_goal_params)
      render json: @project_sub_goal
    else
      render json: @project_sub_goal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_sub_goal.destroy
  end

  private
    def set_project_sub_goal
      @project_sub_goal = ProjectSubGoal.find(params[:id])
    end

    def project_sub_goal_params
      params.require(:project_sub_goal).permit(:project_goal_id, :content, :is_complete)
    end
end
