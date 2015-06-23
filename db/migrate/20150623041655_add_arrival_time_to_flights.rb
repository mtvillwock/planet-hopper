class AddArrivalTimeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :arrival_time, :datetime
  end
end
