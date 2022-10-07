class Api::PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts
    respond_to do |format|
      format.json { render json: @posts.select(:id, :title, :text, :comment_counter, :like_counter, :author_id) }
      format.html { render json: @posts.select(:id, :title, :text, :comment_counter, :like_counter, :author_id) }
    end
  end
end
