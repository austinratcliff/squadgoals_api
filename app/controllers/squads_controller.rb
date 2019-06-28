class SquadsController < ApplicationController
  before_action :set_squad, only: [:show, :update, :destroy]

  def index
    @squads = Squad.all

    render json: @squads
  end

  def show
    render json: @squad
  end

  def create
    @squad = Squad.new(squad_params)

    if @squad.save
      render json: @squad, status: :created, location: @squad
    else
      render json: @squad.errors, status: :unprocessable_entity
    end
  end

  def update
    if @squad.update(squad_params)
      render json: @squad
    else
      render json: @squad.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @squad.destroy
  end

  private
    def set_squad
      @squad = Squad.find(params[:id])
    end

    def squad_params
      params.require(:squad).permit(:user_id)
    end
end
