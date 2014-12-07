class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :hdate
      t.string :hname
      t.boolean :status

      t.timestamps null: false
    end
    add_index :holidays, [:hdate, :hname ], unique: true
  end
end
