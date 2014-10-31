class CreateCycleIssuRequests < ActiveRecord::Migration
  def change
    create_table :cycle_issu_requests do |t|
      t.integer :cycleid
      t.integer :studentid
      t.datetime :to
      t.datetime :from

      t.timestamps
    end
  end
end
