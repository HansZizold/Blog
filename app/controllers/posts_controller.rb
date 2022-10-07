class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all.includes(:post)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    author = current_user
    post = Post.new(params.require(:post).permit(:author, :title, :text))
    post.author = author

    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(author)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def destroy
    author = current_user
    post = Post.find(params[:id])
    comments = Comment.where(post_id: params[:id])
    comments.each(&:destroy)
    likes = Like.where(post_id: params[:id])
    likes.each(&:destroy)
    post.destroy

    if post.destroy
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(author)
    else
      flash.now[:error] = 'Error: Post could not be deleted'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
