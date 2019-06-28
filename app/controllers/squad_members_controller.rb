class SquadMembersController < ApplicationController
  before_action :set_squad_member, only: [:show, :update, :destroy]

  def index
    @squad_members = SquadMember.all

    render json: @squad_members
  end

  def show
    render json: @squad_member
  end

  def create
    @squad_member = SquadMember.new(squad_member_params)

    if @squad_member.save
      render json: @squad_member, status: :created, location: @squad_member
    else
      render json: @squad_member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @squad_member.update(squad_member_params)
      render json: @squad_member
    else
      render json: @squad_member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @squad_member.destroy
  end

  private
    def set_squad_member
      @squad_member = SquadMember.find(params[:id])
    end

    def squad_member_params
      params.require(:squad_member).permit(:squad_id, :member_id)
    end
end
