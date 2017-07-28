class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  has_secure_password
  
  has_one :chore
  has_many :tasks, through: :chore_tasks
end
