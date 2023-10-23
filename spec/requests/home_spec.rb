require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do

    before do
      user = FactoryBot.create(:user)
      puts "User created with ID: #{user.id}"
      sign_in user
    end
    
    
    
    it "returns http success or redirection" do
      get "/"
      if response.redirect?
        puts "Redirected to: #{response.location}"
      else
        expect(response).to have_http_status(:success)
      end
    end
    
  end

end
