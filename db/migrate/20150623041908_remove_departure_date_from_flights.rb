class RemoveDepartureDateFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :departure_date, :datetime
  end
end
