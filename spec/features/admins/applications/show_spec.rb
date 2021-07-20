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

#   As a visitor
# When I visit an admin application show page ('/admin/applications/:id')
# For every pet that the application is for, I see a button to approve the application for that specific pet
# When I click that button
# Then I'm taken back to the admin application show page
# And next to the pet that I approved, I do not see a button to approve this pet
# And instead I see an indicator next to the pet that they have been approved
#
# # As a visitor
# # When there are two applications in the system for the same pet
# # When I visit the admin application show page for one of the applications
# # And I approve or reject the pet for that application
# # When I visit the other application's admin show page
# Then I do not see that the pet has been accepted or rejected for that application
# And instead I see buttons to approve or reject the pet for this specific application

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

end
