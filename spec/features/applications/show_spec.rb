require 'rails_helper'

RSpec.describe 'the application index' do
  before(:each) do
    @app_1 = Application.create!(name_of_applicant: 'Joey', street_address: '1150 vine', city: "Denver", state: "Colorado", zip_code: 80206, description: "i am full of love and have alot of space", status: "In Progress" )
    @app_2 = Application.create(name_of_applicant: 'Joey', street_address: '1150 larimer', city: "Denver", state: "Colorado", zip_code: 80211, description: "i am full of love and have alot of space", status: "Pending" )
    @app_3 = Application.create(name_of_applicant: 'Joey', street_address: '1150 dayton', city: "Aurora", state: "Colorado", zip_code: 80222, description: "i am full of love and have alot of space", status: "Rejected" )
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'Boulder shelter', city: 'Boulder, CO', foster_program: false, rank: 9)
    @pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Bare-y Manilow', shelter_id: @shelter.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)
    @pet_3 = Pet.create(adoptable: true, age: 1, breed: 'domestic shorthair', name: 'Sylvester', shelter_id: @shelter_2.id)
    @pet_4 = Pet.create(adoptable: true, age: 1, breed: 'orange tabby shorthair', name: 'Lasagna', shelter_id: @shelter.id)
    ApplicationPet.create!(pet_id: @pet_1.id, application_id: @app_1.id)
    ApplicationPet.create!(pet_id: @pet_1.id, application_id: @app_2.id)
    ApplicationPet.create!(pet_id: @pet_2.id, application_id: @app_1.id)

  end
  it 'lists all the applications ' do
    
    visit "/applications/#{@app_1.id}"

    expect(page).to have_content(@app_1.name_of_applicant)
    expect(page).to have_content(@app_1.street_address)
    expect(page).to have_content(@app_1.city)
    expect(page).to have_content(@app_1.state)
    expect(page).to have_content(@app_1.zip_code)
    expect(page).to have_content(@app_1.description)
    expect(page).to have_content(@app_1.status)

    within "#pet-#{@pet_1.id}" do
      expect(page).to have_content(@pet_1.name)
    end
    within "#pet-#{@pet_2.id}" do
      expect(page).to have_content(@pet_2.name)
    end
  end
end
