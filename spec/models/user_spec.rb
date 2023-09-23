require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Andy Zam', bio: 'I am trying to be a good developer')

    @fp = Post.create(author: @user, title: 'My first post',
                      text: 'try to be a developer')
    @sp = Post.create(author: @user, title: 'My second post',
                      text: 'try to be a developer again')
    @tp = Post.create(author: @user, title: 'My third post',
                      text: 'try to be a developer again again')

    @recent_posts = @user.post_recent
  end

  describe 'Test for validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid if posts_counter is negative' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end
  end

  describe 'Test for the most recent post'
  it 'Should return equal if return 3 most recent post' do
    expected_results = [@tp, @sp, @fp]
    expect(@recent_posts).to eq(expected_results)
  end
end
