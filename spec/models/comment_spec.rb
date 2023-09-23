require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Andy Zam', bio: 'I am trying to be a good developer')
    @post = Post.create(author: @user, title: 'First post', text: 'This is the first test')
  end

  it "updates post's comments_counter after save" do
    Comment.create(
      author: @user,
      post: @post
    )
    @post.reload
    expect(@post.comments_counter).to eq(1)
  end

  it "updates post's comments_counter after destroy" do
    comment = Comment.create(
      author: @user,
      post: @post
    )

    comment.destroy

    @post.reload

    expect(@post.comments_counter).to eq(0)
  end

  it 'should update the comments_counter attribute of a post' do
    comment = Comment.create(post: @post, author: @user,
                             text: 'This is the first comment')
    Comment.create(post: @post, author: @user,
                   text: 'This is the second comment')

    comment.comments_updater

    expect(@post.comments_counter).to eq(2)
  end
end
