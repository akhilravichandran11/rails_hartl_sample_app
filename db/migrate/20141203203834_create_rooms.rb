class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.string :roomtype
      t.integer :roomcapacity
      t.integer :floor
      t.string :buildingname
      t.string :campusname
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
    add_index :rooms, [:roomname, :buildingname, :campusname ], unique: true
  end
end
