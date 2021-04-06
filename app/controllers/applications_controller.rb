class ApplicationsController < ApplicationController
  def index
    @applications= Application.all
  end
  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    binding.pry
  end
end
