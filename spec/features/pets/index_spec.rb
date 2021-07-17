require 'rails_helper'

RSpec.describe 'the pets index' do
  before :each do
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = Pet.create(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow', shelter_id: @shelter.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe', shelter_id: @shelter.id)
    @pet_3 = Pet.create(adoptable: false, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter.id)

    visit "/pets"
  end
  it 'lists all the pets with their attributes' do

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.breed)
    expect(page).to have_content(@pet_1.age)
    expect(page).to have_content(@shelter.name)

    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_2.breed)
    expect(page).to have_content(@pet_2.age)
    expect(page).to have_content(@shelter.name)
  end

  it 'only lists adoptable pets' do

    expect(page).to_not have_content(@pet_3.name)
  end

  it 'displays a link to edit each pet' do

    expect(page).to have_content("Edit #{@pet_1.name}")
    expect(page).to have_content("Edit #{@pet_2.name}")

    click_link("Edit #{@pet_1.name}")

    expect(page).to have_current_path("/pets/#{@pet_1.id}/edit")
  end

  it 'displays a link to delete each pet' do

    expect(page).to have_content("Delete #{@pet_1.name}")
    expect(page).to have_content("Delete #{@pet_2.name}")

    click_link("Delete #{@pet_1.name}")

    expect(page).to have_current_path("/pets")
    expect(page).to_not have_content(@pet_1.name)
  end

  it 'has a text box to filter results by keyword' do
    visit "/pets"
    expect(page).to have_button("Search")
  end

  it 'lists partial matches as search results' do
    #How do you fill this field in without having a Search label... looks terrible
    fill_in 'Search', with: "Ba"
    click_on("Search")

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
    expect(page).to_not have_content(@pet_3.name)
  end

  it 'displays a link to Start an Application' do

    expect(page).to have_link('Start an Application')
  end

  # it 'can redirect to to nw application page' do
  #
  #   within "#pet-#{@pet_1.id}" do add an id tag to div in order to be able to create a within block... with class?
  #     click_link('Start an Application')
  #
  #   expect(current_path).to eq("/pets/application/new")
  # end
end
