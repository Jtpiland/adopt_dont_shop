require 'rails_helper'

RSpec.describe PetAdoptionApplication, type: :model do
  describe 'relationships' do
    it {should belong_to :pet}
    it {should belong_to :adoption_application}
  end

  it 'can show if a pet has been approved on an application and change its status of adoptable to false' do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, status: 'Pending')
    @pet_adoption = PetAdoptionApplication.create!(adoption_application_id: @applicant_1.id, pet_id: @pet_1.id)

    @pet_adoption.update(status: 'Approved')

    expect(@pet_1.approved?(@applicant_1.id)).to eq(true)
    expect(@pet_1.adoptable).to eq(false)
  end

  it 'can show if a pet has been rejected on an application and change its status of adoptable to false' do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, status: 'Pending')
    @pet_adoption = PetAdoptionApplication.create!(adoption_application_id: @applicant_1.id, pet_id: @pet_1.id)

    @pet_adoption.update(status: 'Rejected')

    expect(@pet_1.rejected?(@applicant_1.id)).to eq(true)
    expect(@pet_1.adoptable).to eq(true)
  end
end
