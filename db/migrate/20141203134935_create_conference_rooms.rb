class CreateConferenceRooms < ActiveRecord::Migration
  def change
    create_table :conference_rooms do |t|
      t.string :name
      t.integer :floor
      t.string :buildingName
      t.string :city
      t.string :state
      t.string :country
      t.string :type
      t.integer :capacity

      t.timestamps null: false
    end
    add_index :conference_rooms, [:name, :buildingName ], unique: true
  end
end
