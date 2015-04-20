class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|

      t.timestamps null: false
    end
  end
end
