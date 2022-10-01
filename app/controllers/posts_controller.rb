class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
    @users = User.all
  end

  def new
    @first_user = current_user
    @post = Post.new
  end

  def create
    @first_user = current_user
    @post = @first_user.posts.create(post_params)

    if @post.save
      redirect_to posts_path(@first_user.id)
      flash[:success] = 'Post saved successfully'
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
