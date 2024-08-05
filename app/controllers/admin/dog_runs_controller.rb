class Admin::DogRunsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_dog_run, only: [:show, :edit, :update, :destroy]

  def new
    @dog_run = DogRun.new
    @dog_run_form = Admin::DogRunRegistrationsForm.new
  end

  def index
    @dog_runs = DogRun.all
  end

  def create
    @dog_run_form = Admin::DogRunRegistrationsForm.new(dog_runs_params:, admin: current_admin)

    if @dog_run_form.save!
      redirect_to admin_dog_runs_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @dog_run.update(dog_run_params)
      redirect_to admin_dog_runs_path
    else
      render :edit
    end
  end

  def destroy
    @dog_run.destroy
    redirect_to admin_dog_runs_path
  end

  private
  def dog_runs_params
    params.require(:admin_dog_run_registrations_form).permit(dog_runs: [:name, :description])
  end

  def dog_run_params
    params.require(:dog_run).permit(:name, :description)
  end

  def set_dog_run
    @dog_run = DogRun.find(params[:id])
  end
end
