class Cycle < ActiveRecord::Base
  belongs_to :chore
  belongs_to :user
end
