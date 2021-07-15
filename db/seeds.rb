# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Shelter.destroy_all
AdoptionApplication.destroy_all

@shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
@pet_1 = @shelter.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
@pet_2 = @shelter.pets.create!(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe')
@pet_3 = @shelter.pets.create!(adoptable: false, age: 4, breed: 'chihuahua', name: 'Elle')

@applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, description: 'I have lots of free time and a huge yard!', pets_applied_for: "#{@pet_1.name}", status: 'Pending')
@applicant_2 = AdoptionApplication.create!(name: 'Dan Dan', street_address: 'Fifth Street', city: 'Tulsa', state: 'OK', zip_code: 74105, description: 'I love animals and Im rich', pets_applied_for: "#{@pet_2.name}", status: 'Pending')
