class AddImagesToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :images, :json
  end
end
