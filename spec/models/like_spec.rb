require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Andy Zam', bio: 'I am trying to be a good developer')
    @post = Post.create(author: @user, title: 'First post', text: 'This is the first test')
  end

  it 'Should return invalid with a empty post' do
    like = Like.new(
      author: @user,
      post: nil
    )
    expect(like).to_not be_valid
  end

  it "updates post's likes_counter after save" do
    Like.create(
      author: @user,
      post: @post
    )

    @post.reload

    expect(@post.likes_counter).to eq(1)
  end

  it "updates post's likes_counter after destroy" do
    like = Like.create(
      author: @user,
      post: @post
    )

    like.destroy

    @post.reload

    expect(@post.likes_counter).to eq(0)
  end

  it 'should update the likes counter' do
    like = Like.create(author: @user, post: @post)

    like.likes_updater

    expect(@post.likes_counter).to eq(1)
  end
end
