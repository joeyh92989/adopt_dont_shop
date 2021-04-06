class ApplicationsController < ApplicationController
  def index
    @applications= Application.all
  end
  def show
    if params[:search].present?
      @application = Application.find(params[:id])
      @pet_search = Pet.search(params[:search])
      @pets = @application.pets
    else
    @application = Application.find(params[:id])
    @pets = @application.pets
    end
  end
  def new
    
  end
  def create
    application = Application.create!(application_params)
    application.save
    redirect_to "/applications/#{application.id}"
  end

  private

  def application_params
    params.permit(:name_of_applicant, :street_address, :city, :state, :zip_code, :description)
  end
end
