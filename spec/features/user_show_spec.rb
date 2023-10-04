require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Andy Zam', photo: 'https://i.pravatar.cc/150')
    @post1 = Post.create(author: @user1, title: 'First one')
    @post2 = Post.create(author: @user1, title: 'Second one')
    @post3 = Post.create(author: @user1, title: 'Third one')
  end

  it 'I can see the users profile picture.' do
    visit user_path(@user1)
    expect(page).to have_css("img[src='#{@user1.photo}']")
  end

  it 'I can see the users username.' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.name)
  end

  it 'I can see the number of posts the user has written.' do
    visit user_path(@user1)
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'I can see the users bio.' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.bio)
  end

  it 'I can see the users first 3 posts.' do
    visit user_path(@user1)
    expect(page).to have_link("Post # #{@post1.id}", href: user_post_path(@user1.id, @post1.id))
  end

  it 'I can see a button that lets me view all of a users posts.' do
    visit user_path(@user1)
    expect(page).to have_link('See all posts', href: user_posts_path(@user1), class: 'button_footer')
  end
end
