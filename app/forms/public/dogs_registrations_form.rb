# app/forms/admin/dog_runs_form.rb
class Public::DogsRegistrationsForm
  include ActiveModel::Model

  attr_accessor :dogs_params
  attr_accessor :user

  validate :all_dogs_must_be_valid

  def save!
    return false unless valid?

    ActiveRecord::Base.transaction do
      dogs.each(&:save!)
    end

    true
  end

  def dogs
    @dog_runs ||= if dogs_params.present?
                    dogs_params[:dogs].values.map do |dog_params|
                      user.dogs.new(dog_params)
                    end
                  else
                    [Dog.new]
                  end
  end

  def all_dogs_must_be_valid
    errors.add(:dogs) if dogs.map(&:invalid?).any?
  end
end
