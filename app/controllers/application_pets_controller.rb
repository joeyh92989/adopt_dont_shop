class ApplicationPetsController < ApplicationController
  def create
    
    ApplicationPet.create!(application_pets_params)
    redirect_to "/applications/#{params[:application_id]}"
  end

  private
  def application_pets_params
    params.permit(:pet_id, :application_id)
  end
end