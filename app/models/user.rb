class User < ActiveRecord::Base
  has_secure_password
  has_many :chores
  has_many :user_chores
end
