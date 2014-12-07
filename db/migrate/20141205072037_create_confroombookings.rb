class CreateConfroombookings < ActiveRecord::Migration
  def change
    create_table :confroombookings do |t|
      t.references :user, index: true
      t.references :room, index: true
      t.boolean :roomstatus
      t.string :roomstatusreason
      t.integer :stHour
      t.integer :stMin
      t.integer :enHour
      t.integer :enMin
      t.integer :bday
      t.integer :bmonth
      t.integer :byear
      t.datetime :bdate

      t.timestamps null: false
    end
    add_foreign_key :confroombookings, :users
    add_foreign_key :confroombookings, :rooms
  end
end
