class AdoptionApplication < ApplicationRecord
  has_many :pet_adoption_applications
  has_many :pets, through: :pet_adoption_applications

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence:true
end
