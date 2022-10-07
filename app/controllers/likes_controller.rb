class LikesController < ApplicationController
  def create
    author = current_user
    post = Post.find(params[:post_id])
    like = Like.new
    like.author = author
    like.post = post
    pp @like

    if like.save
      flash[:success] = 'Like added successfully'
      redirect_to user_post_path(author.id, post.id)
    else
      flash.now[:error] = 'Error: Like could not be added'
    end
  end
end
