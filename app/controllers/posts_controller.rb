class PostsController < ApplicationController
  def index
    return unless params[:user_id]

    @author = User.find(params[:user_id])
    @posts = @author.posts
  end

  def show
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
    @post = @author_posts.find(params[:id])
  end
end
