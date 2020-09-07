class ConnectionsController < ApplicationController
  def index
    @nickname = current_user.nickname
  end
  def new
    @connection = Connection.new
  end
  def create
    Connection.create!(connection_params)
    render :index
  end
  private
  def connection_params
    params.require(:connection).permit(:name, :details, :image, :preference, :dislike).merge(user_id: current_user.id)
  end
end
