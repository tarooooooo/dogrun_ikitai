class Public::DogRunsController < ApplicationController
  before_action :set_dog_run, only: %i(show)

  def index
    @dog_runs = DogRun.all
  end

  def show; end

  private
  def set_dog_run
    @dog_run = DogRun.find(params[:id])
  end
end
