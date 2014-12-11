class AddApprovedToCycleIssuRequests < ActiveRecord::Migration
  def change
    add_column :cycle_issu_requests, :approved, :boolean
  end
end
