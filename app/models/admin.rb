class Admin < ApplicationRecord

  # def approve_app
  #   @application = AdoptionApplication.find(params[:id])
  #   require "pry"; binding.pry
  #   @application.pets.each do |pets|
  #     if pet.status == 'Accepted'
  #      @application.update(status: 'Approved')
  #     # else pet.status == 'Rejected'
  #     #   @application.update(status: 'Rejected')
  #     end
  #   redirect_to "/admin/applications/#{@application.id}"
  #
  # end
end
