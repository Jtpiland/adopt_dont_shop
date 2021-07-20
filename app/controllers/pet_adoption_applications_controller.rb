class PetAdoptionApplicationsController < ApplicationController

  # def create
  #   @application = AdoptionApplication.find(params[:adoption_application_id])
  #   @pet = Pet.find(params[:pet_id])
  #   @application.pets << pet
  #
  #   redirect_to "/applications/#{application.id}"
  # end

  def update
    @pet_application = PetAdoptionApplication.where(adoption_application_id:params[:id], pet_id:params[:pet_id])
    @pet_application.update(status:params[:status])
    redirect_to "/admin/applications/#{params[:id]}"
  end

end
