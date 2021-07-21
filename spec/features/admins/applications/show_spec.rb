require 'rails_helper'

RSpec.describe 'Admin Application Show Page' do
  before :each do
    @shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create!(name: 'B Name', city: 'Tulsa, OK', foster_program: false, rank: 12)
    @pet_1 = @shelter_1.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
    @pet_2 = @shelter_2.pets.create!(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe')
    @applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, description: 'I have lots of free time and a huge yard!', pets_applied_for: "#{@pet_1.name}")
    @applicant_2 = AdoptionApplication.create!(name: 'Dan Dan', street_address: 'Fifth Street', city: 'Tulsa', state: 'OK', zip_code: 74105, description: 'I love animals and Im rich', pets_applied_for: "#{@pet_2.name}")

    PetAdoptionApplication.create!(adoption_application_id: "#{@applicant_1.id}", pet_id: "#{@pet_1.id}")

    visit "/admin/applications/#{@applicant_1.id}"
  end

    it 'has buttons to approve or reject an application for each pet on the application' do

      expect(page).to have_button('Approved')
      expect(page).to have_button('Rejected')
    end

    it 'can redirect back to the admin application show page' do

      click_button 'Approved'

      expect(current_path).to eq("/admin/applications/#{@applicant_1.id}")
    end

    it 'changes the button to an indicator of approval after the application has been approved' do

      click_button 'Approved'

      expect(page).to have_content('Pet Approved')
      expect(page).to_not have_button('Approved')
      expect(page).to_not have_button('Rejected')
    end

    it 'changes the button to an indicator of rejection after the application has been rejected' do

      click_button 'Rejected'

      expect(page).to have_content('Pet Rejected')
      expect(page).to_not have_button('Approved')
      expect(page).to_not have_button('Rejected')
    end

    it 'starts with an application status of nil' do

      expect(page).to have_content('Status:')
      expect(@applicant_1.status).to eq(nil)
    end

    it 'changes the application status to approved if all pets have been approved for adoption' do

      click_button 'Approved'

      expect(page).to have_content('Status:Approved')

      visit "/applications/#{@applicant_1.id}"

      expect(PetAdoptionApplication.first.status).to eq('Approved')
    end

    it 'changes the application status to rejected if any pets have been rejected for adoption' do

      click_button 'Rejected'

      expect(page).to have_content('Status:Rejected')
    end
end
