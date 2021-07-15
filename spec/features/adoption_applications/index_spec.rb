require 'rails_helper'

RSpec.describe 'the application show page' do
  before :each do
    @shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
    @pet_2 = @shelter.pets.create!(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe')
    @applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, description: 'I have lots of free time and a huge yard!', pets_applied_for: "#{@pet_1.name}", status: 'Pending')
    @applicant_2 = AdoptionApplication.create!(name: 'Dan Dan', street_address: 'Fifth Street', city: 'Tulsa', state: 'OK', zip_code: 74105, description: 'I love animals and Im rich', pets_applied_for: "#{@pet_2.name}", status: 'Pending')

    visit '/applications'
  end

  it 'lists all the applications' do

    expect(page).to have_content(@applicant_1.name)
    expect(page).to have_content(@applicant_2.name)
  end

  it 'has a link to each applications show page' do

    expect(page).to have_link("#{@applicant_1.name}")
    expect(page).to have_link("#{@applicant_2.name}")
  end

  it 'can link to the applications show page' do

    click_link "#{@applicant_1.name}"

    expect(current_path).to eq("/applications/#{@applicant_1.id}")
  end
end
