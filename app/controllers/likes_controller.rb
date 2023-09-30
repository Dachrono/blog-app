class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(author: @current_user, post: @post)

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
