class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :destination_country
      t.string :destination_city
      t.string :origin_country
      t.string :origin_city
      t.references :user


      t.timestamps null: false
    end
  end
end
