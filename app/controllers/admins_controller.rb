class AdminsController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql "SELECT * FROM shelters ORDER BY name ASC"
  end

  def show
    @application = AdoptionApplication.find(params[:id])
  end

  
  # def approve_app
  #   @application = AdoptionApplication.find(params[:id])
  #   @application.pets.each do |pets|
  #     # if pet.status == 'Accepted'
  #      @application.update(status: 'Approved')
  #     # else pet.status == 'Rejected'
  #     #   @application.update(status: 'Rejected')
  #     end
  #
  #   redirect_to "/admin/applications/#{@application.id}"
  # end
end
