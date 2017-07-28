class Task < ActiveRecord::Base
  has_many :chore_tasks
  has_many :chores, through: :chore_tasks
  has_many :users, through: :chores
end
