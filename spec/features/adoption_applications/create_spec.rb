require 'rails_helper'

RSpec.describe 'application creation' do
  before :each do
    @shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
    @applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, description: 'I have lots of free time and a huge yard!', pets_applied_for: "#{@pet_1.name}", status: 'Pending')

    visit '/pets/application/new'
  end

  describe 'the application new' do
    it 'renders the new form' do

      expect(page).to have_content('Start an Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street Address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      # expect(find('form')).to have_content('Why Would You Be A Good Home')
    end
  end

  describe 'the application create' do
    context 'given valid data' do
      it 'creates an application and redirects to the application show page' do

        fill_in 'Name', with: 'John John'
        fill_in 'Street Address', with: '123 Street'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'CO'
        fill_in 'Zip Code', with: 80014
        fill_in 'Why Would You Be A Good Home', with: 'I like dags'

        click_button 'Submit'

        # expect(current_path).to eq("/applications/#{application.id}")
        expect(page).to have_content('John John')
      end
    end

    context 'given invalid data' do
      it 're-renders the new form' do

        fill_in 'Name', with: 'John John'

        click_button 'Submit'

        expect(current_path).to eq('/pets/application/new')
        expect(page).to have_content("Error: Field can't be left blank")
      end
    end
  end
end
