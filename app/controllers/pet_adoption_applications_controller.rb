class PetAdoptionApplicationsController < ApplicationController

  def update
    @application = AdoptionApplication.find(params[:id])

    @pet_application = PetAdoptionApplication.where(adoption_application_id:params[:id], pet_id:params[:pet_id])
    @pet_application.update(status:params[:status])
    if PetAdoptionApplication.where(status: 'Approved').count == PetAdoptionApplication.count
      @application.update(status: 'Approved')
    elsif PetAdoptionApplication.where(status: nil).any?
      @application.status
    else
      @application.update(status: 'Rejected')
    end

    redirect_to "/admin/applications/#{params[:id]}"
  end

end
