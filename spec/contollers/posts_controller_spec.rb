require 'rails_helper'

def log_in(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end


RSpec.describe "Posts", type: :system, js: true do
  let(:user) { create(:user) } # Assuming you have a user factory

  before do
    driven_by(:selenium_chrome_headless)
    log_in(user)
  end

  describe "Index page" do
    it "shows the list of posts" do
      visit posts_path
      expect(page).to have_content("Posts")
      # Additional assertions based on your posts data
    end
  end

  describe "Creating a new post" do
    it "allows a user to create a post and displays it" do
      visit new_post_path
      fill_in "Content", with: "New Post Content"
      click_button "Create Post"

      # Expectations after the post is created
      expect(page).to have_content("Post was successfully created.")
      expect(page).to have_content("New Post Content")
    end
  end

  describe "Editing a post" do
    let!(:post) { create(:post, user: user) } # Assuming you have a post factory

    it "allows a user to edit a post" do
      visit edit_post_path(post)
      fill_in "Content", with: "Updated Post Content"
      click_button "Update Post"

      # Expectations after the post is updated
      expect(page).to have_content("Post was successfully updated.")
      expect(page).to have_content("Updated Post Content")
    end
  end

  describe "Deleting a post" do
    let!(:post) { create(:post, user: user) }

    it "allows a user to delete a post" do
      visit posts_path
      accept_confirm do
        click_link "Delete", href: post_path(post)
      end

      # Expectations after the post is deleted
      expect(page).to have_content("Post was successfully destroyed.")
      expect(page).not_to have_content(post.content)
    end
  end
end
