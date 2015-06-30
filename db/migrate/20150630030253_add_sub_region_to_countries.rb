class AddSubRegionToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :subregion, :string
  end
end
