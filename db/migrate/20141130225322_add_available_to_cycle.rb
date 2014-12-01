class AddAvailableToCycle < ActiveRecord::Migration
  def change
    add_column :cycles, :available, :boolean, :default => true
  end
end
