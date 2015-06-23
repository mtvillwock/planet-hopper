class AddDepartureTimeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :departure_time, :datetime
  end
end
