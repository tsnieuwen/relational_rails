class Team < ApplicationRecord
  has_many :athletes
  Team.order("created_at")
end
