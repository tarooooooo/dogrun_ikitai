class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :breed

  has_one :currently_stay_period, -> { currently_staying }, class_name: 'StayPeriod'

  has_one_attached :image

  enum gender: {
    male: 0,
    female: 1,
    other: 2,
  }
end
