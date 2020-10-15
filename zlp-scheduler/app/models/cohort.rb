class Cohort < ApplicationRecord
    has_many :users, dependent: :delete_all
    has_many :time_slots, dependent: :delete_all
    has_one :term
end
