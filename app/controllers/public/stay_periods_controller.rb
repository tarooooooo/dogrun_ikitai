class Public::StayPeriodsController < ApplicationController
  def create
    # TODO: ここをリファクタリングする
    @dog_run = DogRun.find(params[:dog_run_id])
    @dogs = current_user.dogs.where(id: stay_period_params[:dog_id])
    currently_stay_periods = current_user.stay_periods.where(dog_id: @dogs.ids, is_currently_staying: true)
    if currently_stay_periods.present?
      currently_dog_names = Dog.where(id: currently_stay_periods.pluck(:dog_id)).pluck(:name).join(',')
      redirect_to dog_run_path(@dog_run), alert: "「#{currently_dog_names}」は、既に滞在中です。" and return
    end

    @dogs.each do |dog|
      current_user.stay_periods.create(dog: dog, dog_run: @dog_run, is_currently_staying: true, starts_at: Time.current)
    end

    redirect_to dog_run_path(@dog_run), notice: 'チェックインしました。'
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
    params.require(:stay_period).permit(:start_at, :end_at, dog_id: [])
  end
end
