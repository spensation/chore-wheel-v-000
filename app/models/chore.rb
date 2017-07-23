class Chore < ActiveRecord::Base
  belongs_to :user
  has_many :user_chores
end
