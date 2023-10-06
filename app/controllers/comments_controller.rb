class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_data)
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    activeuser = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    if comment.destroy
      # flash[:success] = 'The Post was deleted successfully!'
      redirect_to user_posts_path(activeuser)
    else
      # flash[:error] = 'Error! The Post was not deleted'
      redirect_to user_post_path(activeuser, post)
    end
  end

  private

  def comment_data
    params.require(:comment).permit(:text)
  end
end
