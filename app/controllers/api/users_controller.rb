class Api::UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users.select(:id, :name, :email) }
      format.html { render json: @users.select(:id, :name, :email) }
    end
  end
end
