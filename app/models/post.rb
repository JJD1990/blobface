class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_rich_text :content
end
