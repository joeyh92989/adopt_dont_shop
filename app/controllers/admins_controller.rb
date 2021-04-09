class AdminsController < ApplicationController


  def index
    @shelters= Shelter.all
  end

  def show 
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def update
    app = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    application_pet= ApplicationPet.where('pet_id = ? AND application_id = ?',pet.id,app.id)
    application_pet.update!(status: :"#{params[:status]}")  
    # redirect_to "/admin/applcations/#{params[:application_id}"
  end
end
