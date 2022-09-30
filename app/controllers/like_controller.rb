class LikeController < ApplicationController
  def create
    @first_user = current_user
    @post = Post.find(params[:id])
    @like = Like.new
    @like.author = @first_user
    @like.post = @post
    pp @like

    if @like.save
      flash[:success] = 'Like added successfully'
      redirect_to post_path(@first_user.id)
    else
      flash.now[:error] = 'Error: Like could not be added'
    end
  end
end
