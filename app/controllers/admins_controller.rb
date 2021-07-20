class AdminsController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql "SELECT * FROM shelters ORDER BY name ASC"
  end

  def show
    @application = AdoptionApplication.find(params[:id])
  end

  def approve_pet
    # redirect_to "/admin/applications/#{@application.id}"
  end

  def approve_app
    @application = AdoptionApplication.find(params[:id])
    @application.update(status: 'Approved')

    redirect_to "/admin/applications/#{@application.id}"
  end
end
