class AddDurationToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :duration, :string
  end
end
