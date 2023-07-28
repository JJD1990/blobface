class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :record
  validates :content, presence: true
  has_rich_text :content

  def liked_by?(user)
    likes.where(user: user).any?
  end 

  def like(user)
    likes.where(user: user).first_or_create
  end

  def unlike(user) 
    likes.where(user: user).destroy_all
  end

end
