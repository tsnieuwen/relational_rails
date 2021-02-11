class Resort < ApplicationRecord
  has_many :customers, dependent: :destroy

  def number_of_children
    self.customers.length
  end
end
