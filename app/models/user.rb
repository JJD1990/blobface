class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable
    has_many :posts
    has_many :likes
    has_one_attached :profile_picture
    validates :email, presence: true
    validates :username, presence: true
    enum role: [:user, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def self.ransackable_attributes(auth_object = nil)
    %w[username email]
  end
    
  def set_default_role
    self.role ||= :user
  end
end
