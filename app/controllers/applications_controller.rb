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
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:error]= application.errors.full_messages.to_sentence
      render :new
    end
  end

  def update

    application = Application.find(params[:id])
    application.update!(application_params)
    redirect_to "/applications/#{application.id}"
  end

  private

  def application_params
    params.permit(:name_of_applicant, :street_address, :city, :state, :zip_code, :description, :status)
  end
end
