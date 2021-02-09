class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.boolean :equipment
      t.integer :age

      t.timestamps
    end
  end
end
