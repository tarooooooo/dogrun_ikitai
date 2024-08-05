# app/forms/admin/dog_runs_form.rb
class Admin::DogRunRegistrationsForm
  include ActiveModel::Model

  attr_accessor :dog_runs_params
  attr_accessor :admin

  validate :all_dog_runs_must_be_valid

  def save!
    return false unless valid?

    ActiveRecord::Base.transaction do
      dog_runs.each(&:save!)
    end

    true
  end

  def dog_runs
    @dog_runs ||= if dog_runs_params.present?
     dog_runs_params[:dog_runs].map do |dog_run_params|
        admin.dog_runs.new(dog_run_params)
      end
    else
      [DogRun.new]
    end
  end

  def all_dog_runs_must_be_valid
    errors.add(:dog_runs) if dog_runs.map(&:invalid?).any?
  end
end
