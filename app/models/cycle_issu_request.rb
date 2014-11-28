class CycleIssuRequest < ActiveRecord::Base
  # validates :cycle_id, allow_blank: false
  # validates :student_id, uniqueness: true
  has_many :cycle
  belongs_to :user
end