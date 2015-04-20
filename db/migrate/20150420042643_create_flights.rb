class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :trip
      t.string :airline
      t.string :airport
      t.datetime :departure_date
      t.datetime :return_date

      t.timestamps null: false
    end
  end
end
