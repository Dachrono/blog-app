require 'rails_helper'

RSpec.describe 'Posts show page', type: :request do
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

  it 'I can see the posts title.' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.title)
  end

  it 'I can see who wrote the post.' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@user1.name)
  end

  it 'I can see how many comments it has.' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Comments #{@post1.comments_counter}")
  end

  it 'I can see how many likes it has.' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Likes #{@post1.likes_counter}")
  end

  it 'I can see the post body.' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post1.text)
  end

  it 'I can see the username of each commentor.' do
    visit user_posts_path(@user1)
    @post1.comments do |_item|
      expect(page).to have_content("#{@comment.author.name}: #{comment.text}")
    end
  end
end
