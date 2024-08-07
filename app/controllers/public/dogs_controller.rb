class Public::DogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dog, only: %i(show edit update destroy)

  def new
    @dog_form = Public::DogsRegistrationsForm.new
    @breeds = Breed.all
    @genders = Dog.genders_i18n
    gon.breeds = @breeds
    gon.genders = @genders
  end

  def index
    @dogs = current_user.dogs
  end

  def show; end

  def edit; end

  def update
    if @dog.update(dog_params)
      redirect_to dogs_path
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  def create
    @dog_form = Public::DogsRegistrationsForm.new(dogs_params:, user: current_user)

    if @dog_form.save!
      redirect_to dogs_path
    else
      render :new
    end
  end

  private

  def dogs_params
    params.require(:public_dogs_registrations_form).permit(dogs: [:name, :breed_id, :birth_day, :gender, :image])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed_id, :birth_day, :gender, :image)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
