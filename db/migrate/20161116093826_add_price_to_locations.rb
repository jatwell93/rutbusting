class AddPriceToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :price, :string
  end
end
