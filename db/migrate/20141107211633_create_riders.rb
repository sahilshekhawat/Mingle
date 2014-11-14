class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :source
      t.string :destination

      t.timestamps
    end
  end
end
