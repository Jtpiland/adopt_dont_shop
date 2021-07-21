require 'rails_helper'

RSpec.describe 'the application show page' do
  before :each do
    @shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
    @pet_2 = @shelter.pets.create!(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe')
    @applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, status: 'In Progress')
    @applicant_2 = AdoptionApplication.create!(name: 'Dan Dan', street_address: 'Fifth Street', city: 'Tulsa', state: 'OK', zip_code: 74105, status: 'In Progress')

    visit "/applications/#{@applicant_1.id}"
  end

  it 'can show specific information about that application' do

    expect(page).to have_content(@applicant_1.name)
    expect(page).to have_content(@applicant_1.street_address)
    expect(page).to have_content(@applicant_1.city)
    expect(page).to have_content(@applicant_1.state)
    expect(page).to have_content(@applicant_1.zip_code)
  end

  it 'does not show specific information of other applications' do

    expect(page).to_not have_content(@applicant_2.name)
  end

  it 'can search for adoptable pets and add those pets to application' do

    fill_in :search, with: 'Babe'

    click_on 'Search'

    click_button 'Adopt This Pet'

    expect(@applicant_1.pets).to eq([@pet_2])
  end

  it 'can add a description of why they would be a good home to the page from a form when an application is submitted' do

    fill_in :search, with: 'Babe'

    click_on 'Search'

    click_button 'Adopt This Pet'

    expect(@applicant_1.pets).to eq([@pet_2])

    fill_in 'Why Would You Be A Good Home?', with: '<3'

    click_button 'Submit Your Application'

    expect(page).to have_content('<3')
  end

  it 'can send an error message if the description field is left blank' do

    fill_in :search, with: 'Babe'

    click_on 'Search'

    click_button 'Adopt This Pet'

    click_button 'Submit Your Application'

    expect(page).to have_content("Error: Field can't be left blank")
  end

end
