class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :pet_adoption_applications
  has_many :adoption_applications, through: :pet_adoption_applications

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def approved?(application_id)
    pet_adoption = PetAdoptionApplication.where(adoption_application_id: application_id, pet_id: id).first

    pet_adoption.status == 'Approved'
  end

  def rejected?(application_id)
    pet_adoption = PetAdoptionApplication.where(adoption_application_id: application_id, pet_id: id).first

    pet_adoption.status == 'Rejected'
  end
end
