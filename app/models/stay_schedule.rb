class StaySchedule < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  belongs_to :dog_run

  has_one :stay_period

  scope :unvisited, -> { where.missing(:stay_period) }
  scope :before_visit, -> { unvisited.where(starts_at: ..Time.current) }
end
