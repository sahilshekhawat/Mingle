class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :cycle_id

      t.timestamps
    end
  end
end
