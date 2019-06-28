class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show, :update, :destroy]

  def index
    @connections = Connection.all

    render json: @connections
  end

  def show
    render json: @connection
  end

  def create
    @connection = Connection.new(connection_params)

    if @connection.save
      render json: @connection, status: :created, location: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  def update
    if @connection.update(connection_params)
      render json: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @connection.destroy
  end

  private
    def set_connection
      @connection = Connection.find(params[:id])
    end

    def connection_params
      params.require(:connection).permit(:requester_id, :requestee_id, :request_status_id)
    end
end
