class PetAdoptionApplicationsController < ApplicationController

  # def create
  #   @application = AdoptionApplication.find(params[:adoption_application_id])
  #   @pet = Pet.find(params[:pet_id])
  #   @application.pets << pet
  #
  #   redirect_to "/applications/#{application.id}"
  # end

  def update
    @application = AdoptionApplication.find(params[:id])

    @pet_application = PetAdoptionApplication.where(adoption_application_id:params[:id], pet_id:params[:pet_id])
    @pet_application.update(status:params[:status])

    if @pet_application.where(status: 'Rejected').count > 0
      @application.update(status: 'Rejected') #changes status after each button click instead of the total
    else
      @application.update(status: 'Approved')
    end
    # require "pry"; binding.pry
    redirect_to "/admin/applications/#{params[:id]}"
  end

end
