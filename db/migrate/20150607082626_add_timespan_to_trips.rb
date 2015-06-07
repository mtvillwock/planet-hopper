class AddTimespanToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :timespan, :string
  end
end
