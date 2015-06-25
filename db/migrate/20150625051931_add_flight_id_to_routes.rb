class AddFlightIdToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :flight_id, :integer
  end
end
