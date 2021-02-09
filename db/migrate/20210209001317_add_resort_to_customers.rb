class AddResortToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :resort, foreign_key: true
  end
end
