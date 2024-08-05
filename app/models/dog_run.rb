class DogRun < ApplicationRecord
  belongs_to :admin

  validates :name, presence: true
  validates :description, presence: true
end
