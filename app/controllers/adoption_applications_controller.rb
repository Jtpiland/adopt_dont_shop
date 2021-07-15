class AdoptionApplicationsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @applicant = AdoptionApplication.find(params[:id])
  end

end
