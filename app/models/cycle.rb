class Cycle < ActiveRecord::Base
  has_one :chore
  has_one :user
end
