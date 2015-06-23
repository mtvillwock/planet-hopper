class RemoveReturnDateFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :return_date, :datetime
  end
end
