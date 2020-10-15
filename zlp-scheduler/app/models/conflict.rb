class Conflict < ApplicationRecord
  belongs_to :time_slot
  belongs_to :user
  belongs_to :course
  belongs_to :schedule
end
