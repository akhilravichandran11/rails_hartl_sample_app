class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :ConferenceRoom, index: true
      t.references :user, index: true
      t.string :status
      t.integer :stHour
      t.integer :stMin
      t.datetime :stTime
      t.integer :enHour
      t.integer :enMin
      t.datetime :enTime
      t.integer :day
      t.integer :month
      t.integer :year
      t.datetime :date

      t.timestamps null: false
    end
    add_foreign_key :bookings, :ConferenceRooms
    add_foreign_key :bookings, :users
  end
end
