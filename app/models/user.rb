class User < ActiveRecord::Base
  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true
  has_secure_password

  #has_one :cycle
  has_many :chores
end
