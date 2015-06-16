class RemoveAirportFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :airport, :string
  end
end
