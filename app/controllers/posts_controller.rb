class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts
  end

  def show
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
    @post = @author_posts.find(params[:id])
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @author = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_data)

    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def post_data
    params.require(:post).permit(:title, :text)
  end
end
