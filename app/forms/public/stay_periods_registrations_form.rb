# app/forms/admin/dog_runs_form.rb
class Public::StayPeriodsRegistrationsForm
  include ActiveModel::Model

  attr_accessor :stay_periods_params
  attr_accessor :user
  attr_accessor :dog_run

  validate :all_stay_periods_must_be_valid
  validate :validate_currentry_stay_period
  validate :validate_empty_dog_ids

  def save!
    return false unless valid?

    ActiveRecord::Base.transaction do
      stay_periods.each(&:save!)
    end

    true
  end

  def dog_ids
    @dog_ids ||= if stay_periods_params.present?
                   stay_periods_params[:dog_ids].reject(&:empty?)
                  else
                    []
                 end
  end

  def stay_periods
    @stay_periods ||= if stay_periods_params.present?
                        dog_ids.map do |dog_id|
                          user.stay_periods.new(
                            dog_id:,
                            dog_run: dog_run,
                            starts_at: Time.current
                          )
                        end
                  else
                    [StayPeriod.new]
                  end
  end

  def all_stay_periods_must_be_valid
    errors.add(:stay_periods) if stay_periods.map(&:invalid?).any?
  end

  def validate_currentry_stay_period
    dog_ids = stay_periods_params[:dog_ids].reject(&:empty?)
    currently_stay_periods = user.stay_periods.where(dog_id: dog_ids, is_currently_staying: true)

    if currently_stay_periods.present?
      currently_dog_names = Dog.where(id: currently_stay_periods.pluck(:dog_id)).pluck(:name).join(',')
      errors.add(:base, "「#{currently_dog_names}」は、既に滞在中です。")
    end
  end

  def validate_empty_dog_ids
    errors.add(:base, '犬を選択してください') if dog_ids.empty?
  end
end
