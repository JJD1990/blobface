require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com', password: 'password')
    expect(user).not_to be_valid
  end

  it 'has many posts' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    expect(user.posts).to be_empty

    post = Post.new(content: 'Hello, world!')
    user.posts << post

    expect(user.posts).to include(post)
  end
end

