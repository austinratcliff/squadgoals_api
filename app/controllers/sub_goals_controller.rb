class SubGoalsController < ApplicationController
  before_action :set_sub_goal, only: [:show, :update, :destroy]

  def index
    @sub_goals = SubGoal.all

    render json: @sub_goals
  end

  def show
    render json: @sub_goal
  end

  def create
    @sub_goal = SubGoal.new(sub_goal_params)

    if @sub_goal.save
      render json: @sub_goal, status: :created, location: @sub_goal
    else
      render json: @sub_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @sub_goal.update(sub_goal_params)
      render json: @sub_goal
    else
      render json: @sub_goal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @sub_goal.destroy
  end

  private
    def set_sub_goal
      @sub_goal = SubGoal.find(params[:id])
    end

    def sub_goal_params
      params.require(:sub_goal).permit(:goal_id, :content, :is_complete)
    end
end
