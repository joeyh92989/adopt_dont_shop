require 'rails_helper'

RSpec.describe 'the admin application- show' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @pet_4 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 5, adoptable: true)
    @app_1 = Application.create!(name_of_applicant: 'Joey', street_address: '1150 vine', city: "Denver", state: "Colorado", zip_code: 80206, description: "i am full of love and have alot of space", status: "In Progress" )
    @app_2 = Application.create(name_of_applicant: 'Joey', street_address: '1150 larimer', city: "Denver", state: "Colorado", zip_code: 80211, description: "i am full of love and have alot of space", status: "Pending" )
    @app_3 = Application.create(name_of_applicant: 'Joey', street_address: '1150 dayton', city: "Aurora", state: "Colorado", zip_code: 80222, description: "i am full of love and have alot of space", status: "Rejected" )
    ApplicationPet.create!(pet_id: @pet_1.id, application_id: @app_1.id)
    ApplicationPet.create!(pet_id: @pet_1.id, application_id: @app_2.id)
    ApplicationPet.create!(pet_id: @pet_2.id, application_id: @app_1.id)

  end

  it "shows the approve button for each pet on an application" do
      
    visit "admin/applications/#{@app_1.id}"
      
    within "#pet-#{@pet_1.id}" do
      expect(page).to have_button("Approve")
    end
    within "#pet-#{@pet_2.id}" do
      expect(page).to have_button("Approve")
    end
  end

  it "when i select the approve button, it becomes approved" do
      
    visit "admin/applications/#{@app_1.id}"

    within "#pet-#{@pet_1.id}" do
      click_on('Approve')
      expect(page).to have_content("Approved")
    end
    within "#pet-#{@pet_2.id}" do
      click_on('Approve')
      expect(page).to have_content("Approved")
    end
  end

  it "when i select the approve button, it becomes approved" do
      
    visit "admin/applications/#{@app_1.id}"
    
    within "#pet-#{@pet_1.id}" do
      expect(page).to have_button("Reject")
      click_on('Reject')
      expect(page).to have_content("Rejected")
    end
    within "#pet-#{@pet_2.id}" do
      expect(page).to have_button("Reject")
      click_on('Reject')
      expect(page).to have_content("Rejected")
    end
  end
end
