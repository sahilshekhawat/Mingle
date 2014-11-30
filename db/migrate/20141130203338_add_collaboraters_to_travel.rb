class AddCollaboratersToTravel < ActiveRecord::Migration
  def change
    add_column :travels, :collaborators, :text
  end
end
