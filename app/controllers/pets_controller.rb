class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet), notice: "Welcome to #{@pet.name} in the wonderfull community of The Petsitter!"
    else
      render 'new'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :pet_owner_id, :photo)
  end
end
