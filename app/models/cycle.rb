class Cycle < ActiveRecord::Base
  validates :cycle_id, numericality: {greater_than_or_equal_to: 1}
end