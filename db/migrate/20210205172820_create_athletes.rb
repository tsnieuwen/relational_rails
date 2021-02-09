class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :age
      t.boolean :injury_list

      t.timestamps
    end
  end
end
