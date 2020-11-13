class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @markers =
      {
        lat: @pet.pet_owner.latitude,
        lng: @pet.pet_owner.longitude
      }
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.pet_owner = current_user
    if @pet.save
      redirect_to pet_path(@pet), notice: "Welcome to #{@pet.name} in the wonderfull community of The Petsitters!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :photo, :start_date, :end_date)
  end
end
