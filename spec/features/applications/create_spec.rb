require 'rails_helper'

RSpec.describe 'application creation' do
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
  describe 'the application new' do
    it 'renders the new form' do
      visit "/pets"

      click_link ("New Application")

      expect(page).to have_current_path("/applications/new")
     

      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip code')
    end
  end
  describe 'the application create' do
    context 'given valid data' do
      it 'creates the application and redirects to application show' do

        visit "/applications/new"

        fill_in 'name_of_applicant', with: 'Joey'
        fill_in 'Street address', with: '1150 vine'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'Colorado'
        fill_in 'Zip code', with: 80206
        click_button 'Save'


        expect(page).to have_current_path("/applications/#{Application.all.last.id}")
        expect(page).to have_content('Joey')
        expect(page).to have_content('1150 vine')
        expect(page).to have_content('Denver')
        expect(page).to have_content('Colorado')
        expect(page).to have_content(80206)
      end
    end
  end
end