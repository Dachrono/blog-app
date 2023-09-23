require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Andy Zam', bio: 'I am trying to be a good developer')
    @post = Post.new(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: @user)
  end

  it 'should update the posts_counter' do
    first_post = Post.create(author: @user,
                             title: 'My first post',
                             text: 'Is the first post')
    first_post.post_updater

    expect(@user.posts_counter).to eq(1)
  end

  it 'should return an empty array when the post does not have any comment' do
    recent_comments = @post.comments_recent
    expected_results = []

    expect(recent_comments).to eq(expected_results)
  end

  it 'is valid with valid attributes' do
    expect(@post).to be_valid
  end

  it 'is not valid without a title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'is not valid if comments_counter is negative' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'is not valid if likes_counter is negative' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it "updates author's posts_counter after save" do
    Post.create(
      title: 'Test Post',
      comments_counter: 0,
      likes_counter: 0,
      author: @user
    )

    @user.reload

    expect(@user.posts_counter).to eq(1)
  end

  it "updates author's posts_counter after destroy" do
    post = Post.create(
      title: 'Test Post',
      comments_counter: 0,
      likes_counter: 0,
      author: @user
    )

    post.destroy

    @user.reload

    expect(@user.posts_counter).to eq(0)
  end
end
