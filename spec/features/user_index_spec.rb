require 'rails_helper'

RSpec.describe 'User index page', type: :request do
  before do
    @user1 = User.create(name: 'Andy Zam', photo: 'https://i.pravatar.cc/150', posts_counter: 2)
    @user2 = User.create(name: 'Carmen Güemes', photo: 'https://i.pravatar.cc/150', posts_counter: 3)
    @user3 = User.create(name: 'Hernan Bravo', photo: 'https://i.pravatar.cc/150', posts_counter: 4)
  end

  it 'I can see the username of all other users.' do
    visit users_path
    expect(page).to have_content 'Andy Zam'
    expect(page).to have_content 'Carmen Güemes'
    expect(page).to have_content 'Hernan Bravo'
  end

  it 'I can see the profile picture for each user.' do
    visit users_path
    expect(page).to have_css("img[src='#{@user1.photo}']")
    expect(page).to have_css("img[src='#{@user2.photo}']")
    expect(page).to have_css("img[src='#{@user3.photo}']")
  end

  it 'I can see the number of posts each user has written' do
    visit users_path
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
    expect(page).to have_content("Number of posts: #{@user2.posts_counter}")
    expect(page).to have_content("Number of posts: #{@user3.posts_counter}")
  end

  it 'When I click on a user, I am redirected to that users show page.' do
    visit users_path
    click_on 'Andy Zam'
    expect(page).to have_current_path(user_path(@user1))
  end
end
