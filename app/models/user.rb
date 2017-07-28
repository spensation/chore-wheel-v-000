class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  has_secure_password

  has_many :chores
  has_many :tasks, through: :chores
end
