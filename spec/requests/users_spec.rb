require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.create(name: 'Andy Zam', bio: 'I am trying to be a good developer')
    @url = users_url
  end

  describe 'GET /index' do
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
      expect(response.body).to include(@user.name.to_s)
    end
  end

  describe 'GET /show' do
    it 'responds with a successful HTTP status' do
      get user_url(@user)
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get user_url(@user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_url(@user)
      expect(response.body).to include(@user.name.to_s)
    end
  end
end
