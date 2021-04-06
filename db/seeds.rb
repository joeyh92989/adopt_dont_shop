# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

VeterinaryOffice.destroy_all
Veterinarian.destroy_all
Shelter.destroy_all
Pet.destroy_all
Application.destroy_all
ApplicationPet.destroy_all

@vet_office_1 = VeterinaryOffice.create(name: 'Special Friends', boarding_services: true, max_patient_capacity: 100)
@vet_office_2 = VeterinaryOffice.create(name: 'Pet Emergency Room', boarding_services: true, max_patient_capacity: 50)
@vet_office_3 = VeterinaryOffice.create(name: 'The Country Vet', boarding_services: true, max_patient_capacity: 200)
@vet_office_1.veterinarians.create(name: 'Morgan', on_call: true, review_rating: 10)
@vet_office_1.veterinarians.create(name: 'Heather', on_call: true, review_rating: 9)
@vet_office_3.veterinarians.create(name: 'John', on_call: true, review_rating: 9)
@shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
@shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
@shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
@pet_1= @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
@pet_2= @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
@pet_3= @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
@app_1 = Application.create!(name_of_applicant: 'Joey', street_address: '1150 vine', city: "Denver", state: "Colorado", zip_code: 80206, description: "i am full of love and have alot of space", status: "In Progress" )
@app_2 = Application.create(name_of_applicant: 'Joey', street_address: '1150 larimer', city: "Denver", state: "Colorado", zip_code: 80211, description: "i am full of love and have alot of space", status: "Pending" )
@app_3 = Application.create(name_of_applicant: 'Joey', street_address: '1150 dayton', city: "Aurora", state: "Colorado", zip_code: 80222, description: "i am full of love and have alot of space", status: "Rejected" )
@ap_1= ApplicationPet.create!(pet_id: @pet_1.id, application_id: @app_1.id)
@ap_2= ApplicationPet.create!(pet_id: @pet_1.id, application_id: @app_2.id)
@ap_3= ApplicationPet.create!(pet_id: @pet_2.id, application_id: @app_1.id)
