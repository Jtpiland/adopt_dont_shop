# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PetAdoptionApplication.destroy_all
Pet.destroy_all
Shelter.destroy_all
AdoptionApplication.destroy_all

@shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
@shelter_2 = Shelter.create!(name: 'Austin Pets Alive', city: 'Austin, TX', foster_program: false, rank: 5)
@shelter_3 = Shelter.create!(name: 'B Name', city: 'Tulsa, OK', foster_program: false, rank: 12)
@pet_1 = @shelter_1.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
@pet_2 = @shelter_1.pets.create!(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe')
@pet_3 = @shelter_2.pets.create!(adoptable: false, age: 4, breed: 'chihuahua', name: 'Elle')
@pet_4 = @shelter_2.pets.create!(adoptable: true, age: 4, breed: 'pug', name: 'Jack')


@applicant_1 = AdoptionApplication.create!(name: 'John John', street_address: '123 Street', city: 'Denver', state: 'CO', zip_code: 80014, status: "In Progress")
@applicant_2 = AdoptionApplication.create!(name: 'Dan Dan', street_address: 'Fifth Street', city: 'Tulsa', state: 'OK', zip_code: 74105, status: "In Progress")

@vet_office = VeterinaryOffice.create(name: 'Best Vets', boarding_services: true, max_patient_capacity: 20)

@vet = Veterinarian.create(name: 'Taylor', review_rating: 10, on_call: false, veterinary_office_id: vet_office.id)
