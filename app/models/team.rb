class Team < ApplicationRecord
  has_many :athletes, dependent: :destroy
  Team.order("created_at")
end
