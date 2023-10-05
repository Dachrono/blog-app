require 'rails_helper'

RSpec.describe 'Comment Creation', type: :feature do
  before :each do
    @user1 = User.create(name: 'Andy Zam', photo: 'https://i.pravatar.cc/150')
    @post1 = Post.create(author: @user1, title: 'First one', text: 'Hello everybody', comments_counter: 1,
                         likes_counter: 1)
  end

  scenario 'User adds a new comment to a post' do
    visit user_post_path(@user1, @post1)

    fill_in 'Text', with: 'This is a new comment for the post'

    click_button 'Add Comment'

    expect(page).to have_content('This is a new comment for the post')
  end
end
