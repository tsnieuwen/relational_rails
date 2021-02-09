class CreateResort < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :city
      t.integer :cost
      t.boolean :at_capacity

      t.timestamps
    end
  end
end
