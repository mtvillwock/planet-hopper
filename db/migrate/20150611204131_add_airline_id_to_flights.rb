class AddAirlineIdToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :airline_id, :integer
  end
end
