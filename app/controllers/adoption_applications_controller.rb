class AdoptionApplicationsController < ApplicationController
  def index
    @applications = AdoptionApplication.all
  end

  def new
  end

  def show
    @application = AdoptionApplication.find(params[:id])
  end

  def create
    application = AdoptionApplication.new(app_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/pets/application/new"
      flash[:alert] = "Error: Field can't be left blank"
    end
  end

  private

  def app_params
    params.permit(:id, :name, :street_address, :city, :state, :zip_code, :description, :status)
  end

end
