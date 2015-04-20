class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.string :origin_country
      t.string :destination_country
      t.references :user
      t.references :country

      t.timestamps null: false
    end
  end
end
