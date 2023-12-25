require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
 let(:user) { create(:user) }
 let(:valid_attributes) { { content: 'Test content', user_id: user.id } }
 let(:invalid_attributes) { { content: '', user_id: nil } }

  before do
    driven_by(:selenium_chrome_headless)
    sign_in :user
  end

  it 'loads posts successfully' do
    visit posts_path
    expect(page).to have_content('Posts')
    # Other assertions...
  end

  it 'creates a new post via Turbo Stream' do
    visit new_post_path
    fill_in 'Content', with: 'New post content'
    click_button 'Create Post'
    expect(page).to have_content('New post content')
    # Assert the Turbo Stream update occurred as expected
  end
end
