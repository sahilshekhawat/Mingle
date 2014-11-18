class AddColumnsToTravel < ActiveRecord::Migration
  def change
    add_column :travels, :tlatitude, :float
    add_column :travels, :tlongitude, :float
    add_column :travels, :flatitude, :float
    add_column :travels, :flongitude, :float
  end
end
