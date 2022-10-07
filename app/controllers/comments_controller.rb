class CommentsController < ApplicationController
  def create
    author = current_user
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.author = author
    comment.post = post

    if comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(author.id, post.id)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
  end

  def destroy
    author = current_user
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy

    if comment.destroy
      flash[:success] = 'Post saved successfully'
      redirect_to user_post_path(author.id, post.id)
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:author, :post, :text)
  end
end
