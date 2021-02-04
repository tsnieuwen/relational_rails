class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :city
      t.string :name
      t.boolean :playoff_picture
      t.integer :championships

      t.timestamps
    end
  end
end
