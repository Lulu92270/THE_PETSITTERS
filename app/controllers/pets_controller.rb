class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @markers = @pet.pet_owner.address.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
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

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :photo)
  end
end
