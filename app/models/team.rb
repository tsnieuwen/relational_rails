class Team < ApplicationRecord
  has_many :athletes, dependent: :destroy
  Team.order("created_at")

  def filter_athletes(integer)
    athletes.where("age > #{integer}")
  end
end
