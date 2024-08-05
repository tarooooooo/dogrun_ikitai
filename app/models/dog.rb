class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :breed

  enum gender: {
    male: 0,
    female: 1,
    other: 2,
  }
end
