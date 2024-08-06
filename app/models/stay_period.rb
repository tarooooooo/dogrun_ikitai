class StayPeriod < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  belongs_to :dog_run

  scope :currently_staying, -> { where(is_currently_staying: true) }
end
