class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :cycleid
      t.string :model

      t.timestamps
    end
  end
end
