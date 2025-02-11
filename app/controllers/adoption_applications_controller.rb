class AdoptionApplicationsController < ApplicationController
  def index
    @applications = AdoptionApplication.all
  end

  def new
  end

  def show
    @application = AdoptionApplication.find(params[:id])
    if params[:search]
      @pets = Pet.search(params[:search]).to_a
    end
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

  def adopt
    application = AdoptionApplication.find(params[:adoption_application_id])
    pet = Pet.find(params[:pet_id])
    application.pets << pet
    redirect_to "/applications/#{application.id}"
  end

  def update 
    @application = AdoptionApplication.find(params[:id])
    if !params[:description].empty?
      @application.update(description: params[:description])
      @application.update(status: params[:status])
      redirect_to "/applications/#{@application.id}"
    else
      flash[:alert] = "Error: Field can't be left blank"
      redirect_to "/applications/#{@application.id}"
    end
  end

  private

  def app_params
    params.permit(:id, :name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end
