require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(username: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:post_object) { Post.create(content: 'Hello, world!', likes_count: 0, user: user) }

  before do
    user.save
    sign_in user
  end

  describe "GET #index" do
    it 'should show a list of posts' do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it 'creates a new post' do
      sign_in user # Sign in the user
      post :create, params: { post: { content: post_object.content, user_id: user.id } }
      expect(response).to redirect_to(Post.last)
    end
  end
  
  describe "PUT #update" do
    it 'updates a post' do
      sign_in user # Sign in the user
      put :update, params: { id: post_object.id, post: { content: "Updated content.", user_id: user.id } }
      expect(response).to redirect_to(post_object)
    end
  end
  
  describe "DELETE #destroy" do
    it 'destroys a post' do
      sign_in user # Sign in the user
      delete :destroy, params: { id: post_object.id }
      expect(response).to redirect_to(posts_url)
    end
  end
  
end
