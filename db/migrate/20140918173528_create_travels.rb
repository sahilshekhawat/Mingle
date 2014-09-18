class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :from
      t.string :to
      t.datetime :datetime
      t.references :user, index: true
      t.string :medium

      t.timestamps
    end
  end
end
