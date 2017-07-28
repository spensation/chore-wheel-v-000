class Chore < ActiveRecord::Base
  belongs_to :user
  has_many :chore_tasks
  has_many :task, through: :chore_tasks
end
