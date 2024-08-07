class Public::StayPeriods::EndsAtsController < ApplicationController
  def update
    stay_period = StayPeriod.find(params[:stay_period_id])
    if stay_period.update(ends_at: Time.current, is_currently_staying: false)
      redirect_to dog_run_path(stay_period.dog_run)
    else
      @dogs = current_user&.dogs
      @stay_periods_form = Public::StayPeriodsRegistrationsForm.new
      render 'public/dog_runs/show'
    end
  end
end
