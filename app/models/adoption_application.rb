class AdoptionApplication < ApplicationRecord
  has_many :pet_adoption_applications
  has_many :pets, through: :pet_adoption_applications

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: false # allows field to be left blank

  # def status
  #   application = ApdoptionApplication.find(params[:id])
  #   pet = Pet.find(params[:pet_id])
  #
  # end
  # def approve_app
  #   require "pry"; binding.pry
  #   @application = AdoptionApplication.find(params[:id])
  #   @application.pets.each do |pets|
  #     if pet.status == 'Accepted'
  #      @application.update(status: 'Approved')
  #     # else pet.status == 'Rejected'
  #     #   @application.update(status: 'Rejected')
  #     end
  #   redirect_to "/admin/applications/#{@application.id}"
  # end
end
