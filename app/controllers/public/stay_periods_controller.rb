class Public::StayPeriodsController < ApplicationController
  def create
    @dog_run = DogRun.find(params[:dog_run_id])
    @dogs = current_user.dogs
    @stay_periods_form = Public::StayPeriodsRegistrationsForm.new(
      stay_periods_params: stay_period_params,
      user: current_user,
      dog_run: @dog_run,
    )

    if @stay_periods_form.save!
      redirect_to dog_run_path(@dog_run), notice: 'チェックインしました。'
    else
      render 'public/dog_runs/show'
    end
  end

  def update
    @stay_period = StayPeriod.find(params[:id])
    if @stay_period.update(stay_period_params)
      redirect_to dog_run_path(@stay_period.dog_run)
    else
      render 'public/dog_runs/show'
    end
  end

  private
  def stay_period_params
    params.require(:public_stay_periods_registrations_form).permit(:start_at, :end_at, dog_ids: [])
  end
end
