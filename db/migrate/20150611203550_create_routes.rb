class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :airline_id
      t.integer :origin_airport_id
      t.integer :destination_airport_id
    end
  end
end
