class StayPeriod < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  belongs_to :dog_run
end
