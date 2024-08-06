class Public::DogRunsController < ApplicationController
  before_action :set_dog_run, only: %i(show)
  before_action :authenticate_user!

  def index
    @dog_runs = DogRun.all
  end

  def show
    @dogs = current_user&.dogs
    @stay_periods_form = Public::StayPeriodsRegistrationsForm.new
  end

  private
  def set_dog_run
    @dog_run = DogRun.find(params[:id])
  end
end
