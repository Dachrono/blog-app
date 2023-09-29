require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before :each do
    @user = User.create(name: 'Andy Zam', bio: 'I am trying to be a good developer')
    @post = Post.create(title: 'Test Post', text: 'post for testing', author: @user)
  end

  describe 'GET /index' do
    before :each do
      @url = user_posts_url(@user)
    end

    it 'responds with a successful HTTP status' do
      get @url
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get @url
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get @url
      expect(response.body).to include('Here is a list of posts for one user')
    end
  end

  describe 'GET /show' do
    before :each do
      @url = user_post_path(@user, @post)
    end

    it 'responds with a successful HTTP status' do
      get @url
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get @url
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get @url
      expect(response.body).to include('Here is a description for a post for one user')
    end
  end
end

#
#   before :each do
#     @user = User.create(name: 'William Brown', bio: 'Hi! I am William and I am Frontend Developer')
#     @post = Post.create(author: @user, title: 'Post #1',
#                         text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit')
#   end
#
#   describe 'GET /index' do
#     before :each do
#       @user_url_posts = user_posts_url(@user)
#     end
#
#     # test if the response status was correct (status 200).
#     it 'returns http success' do
#       get @user_url_posts
#       expect(response).to have_http_status(:success)
#     end
#
#     # test if a correct template was rendered.
#     it 'renders the index template' do
#       get @user_url_posts
#       expect(response).to render_template(:index)
#     end
#
#     # test If the response body includes correct content.
#     it 'renders the index template with correct content' do
#       get @user_url_posts
#
#       expected_result_user = @user.name.to_s
#       expect(response.body).to include(expected_result_user)
#
#       expected_result_num_posts = "number of posts: #{@user.id}"
#       expect(response.body).to include(expected_result_num_posts)
#     end
#   end
#
#   describe 'GET /show' do
#     before :each do
#       @user_url_post = user_post_path(@user, @post)
#     end
#
#     # test if the response status was correct (status 200).
#     it 'returns http success' do
#       get @user_url_post
#       expect(response).to have_http_status(:success)
#     end
#
#     # test if a correct template was rendered.
#     it 'renders the show template' do
#       get @user_url_post
#       expect(response).to render_template(:show)
#     end
#
#     # test If the response body includes correct content.
#     it 'renders the index template with correct content' do
#       get @user_url_post
#
#       expected_result = "Post ##{@post.id}"
#       expect(response.body).to include(expected_result)
#     end
#   end
# end
#
