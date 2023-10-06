class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts.includes(:comments)
  end

  def show
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
    @post = @author_posts.find(params[:id])
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @author = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_data)

    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    activeuser = params[:user_id]
    if post.destroy
    #  flash[:success] = 'The Post was deleted successfully!'
      redirect_to user_posts_path(activeuser)
    else
    #  flash[:error] = 'Error! The Post was not deleted'
      redirect_to user_post_path(activeuser, post)
    end
  end

  private

  def post_data
    params.require(:post).permit(:title, :text)
  end
end
