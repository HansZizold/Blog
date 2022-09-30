class CommentController < ApplicationController
  def create
    @first_user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.author = @first_user
    @comment.post = @post

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to post_path(@first_user.id)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
  end

  def comment_params
    params.require(:comment).permit(:author, :post, :text)
  end
end
