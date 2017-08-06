class User < ActiveRecord::Base
  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true
  has_secure_password

  has_many :chores
  has_many :tasks, through: :chores

  def current_user
    User.find(session[:user_id])
  end
end
