require 'rails_helper'

RSpec.describe 'Post new page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Andy Zam', photo: 'https://i.pravatar.cc/150')
  end

  scenario 'User creates a new post' do
    visit new_user_post_path(@user1)

    fill_in 'Title', with: 'New Post Title'
    fill_in 'Text', with: 'This is the content of the new post'

    click_button 'Create Post'

    expect(page).to have_content('New Post Title')
    expect(page).to have_content('This is the content of the new post')
  end
end
