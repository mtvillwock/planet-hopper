class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.integer :city_id
      t.string :name
      t.string :airport_code
    end
  end
end
