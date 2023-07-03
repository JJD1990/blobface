class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable
    has_many :posts
    has_one_attached :profile_picture
    validates :email, presence: true
    # validates :password, presence: true
end
