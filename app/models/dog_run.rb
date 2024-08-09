class DogRun < ApplicationRecord
  belongs_to :admin

  validates :name, presence: true
  validates :description, presence: true

  has_many :stay_periods
  has_many :currenty_stay_periods, -> { currently_staying }, class_name: "StayPeriod"
  has_many :currenty_dogs, through: :currenty_stay_periods, source: :dog
  has_many :stay_schedules
end
