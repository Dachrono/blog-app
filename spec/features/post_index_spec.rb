require 'rails_helper'

RSpec.describe 'Posts index page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Andy Zam', photo: 'https://i.pravatar.cc/150')
    @user2 = User.create(name: 'Carmen Güemes', photo: 'https://i.pravatar.cc/150')
    @post1 = Post.create(author: @user1, title: 'First one', text: 'Hello everybody', comments_counter: 1,
                         likes_counter: 1)
    @post2 = Post.create(author: @user1, title: 'Second one')
    @post3 = Post.create(author: @user1, title: 'Third one')
    @comment1 = Comment.create(author: @user2, post: @post1, text: 'Comment one')
    @like1 = Like.create(author: @user2, post: @post1)
  end

  it 'I can see the users profile picture.' do
    visit user_posts_path(@user1)
    expect(page).to have_css("img[src='#{@user1.photo}']")
  end

  it 'I can see the users username.' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@user1.name)
  end

  it 'I can see the number of posts the user has written.' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'I can see a posts title.' do
    visit user_posts_path(@user1)
    expect(page).to have_link("Post # #{@post1.id}", href: user_post_path(@user1.id, @post1.id))
  end

  it 'I can see some of the posts body.' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post1.text[0..85])
  end

  it 'I can see the first comments on a post.' do
    visit user_posts_path(@user1)
    @user1.posts do |post|
      comments = post.five_recent_comments
      expect(page).to have_content(comments[0].text)
    end
  end

  it 'I can see how many comments a post has.' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Comments #{@post1.comments_counter}")
  end

  it 'I can see how many likes a post has.' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Likes #{@post1.likes_counter}")
  end
end
