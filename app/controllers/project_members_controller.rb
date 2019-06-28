class ProjectMembersController < ApplicationController
  before_action :set_project_member, only: [:show, :update, :destroy]

  def index
    @project_members = ProjectMember.all

    render json: @project_members
  end

  def show
    render json: @project_member
  end

  def create
    @project_member = ProjectMember.new(project_member_params)

    if @project_member.save
      render json: @project_member, status: :created, location: @project_member
    else
      render json: @project_member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project_member.update(project_member_params)
      render json: @project_member
    else
      render json: @project_member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_member.destroy
  end

  private
    def set_project_member
      @project_member = ProjectMember.find(params[:id])
    end

    def project_member_params
      params.require(:project_member).permit(:project_id, :member_id)
    end
end
