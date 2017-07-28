class Task < ActiveRecord::Base
  belongs_to :chore
  has_many :chore_tasks
  has_one :user, through: :chore
end
