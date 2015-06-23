class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :trip
      # t.integer :trip_id
      t.string :airline
      t.string :airport
      t.datetime :departure_date
      t.datetime :return_date
      # need to change this to arrival time and departure time
      # departure date and return date don't make sense for a single flight

      t.timestamps null: false
    end
  end
end
