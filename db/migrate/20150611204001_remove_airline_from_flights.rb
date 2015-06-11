class RemoveAirlineFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :airline, :string
  end
end
