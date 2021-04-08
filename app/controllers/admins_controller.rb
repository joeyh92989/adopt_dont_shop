class AdminsController < ApplicationController


  def index
    @shelters= Shelter.all
  end

  def show
    
  end

end
