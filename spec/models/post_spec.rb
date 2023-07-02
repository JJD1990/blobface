require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    post = Post.new(content: 'Hello, world!')
    expect(post).to be_valid
  end

  it 'is not valid without content' do
    post = Post.new
    expect(post).not_to be_valid
  end

  it 'belongs to a user' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    post = Post.new(content: 'Hello, world!', user: user)

    expect(post.user).to eq(user)
  end
end

