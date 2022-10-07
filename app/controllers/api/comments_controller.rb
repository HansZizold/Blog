class Api::CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    respond_to do |format|
      format.json { render json: @comments.select(:id, :text, :author_id, :post_id) }
      format.html { render json: @comments.select(:id, :text, :author_id, :post_id) }
    end
  end

  def create
    author = current_user
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.author = author
    comment.post = post

    if comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
