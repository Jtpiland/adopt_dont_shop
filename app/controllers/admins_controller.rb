class AdminsController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql "SELECT * FROM shelters ORDER BY name ASC"
  end

  def show
    @application = AdoptionApplication.find(params[:id])
  end
end
