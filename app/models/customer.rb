class Customer < ApplicationRecord
  belongs_to :resort

  def self.return_customers_who_rented
    where(equipment: true)
  end

  def self.return_customers_age_over_threshold(threshold)
    where("age > #{threshold}")
  end

  def self.return_customers_sorted_alpha
    order(:name)
  end
end
