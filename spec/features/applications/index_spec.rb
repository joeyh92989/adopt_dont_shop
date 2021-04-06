require 'rails_helper'

RSpec.describe 'the application index' do
  before(:each) do
    @app_1 = Application.create!(name_of_applicant: 'Joey', street_address: '1150 vine', city: "Denver", state: "Colorado", zip_code: 80206, description: "i am full of love and have alot of space", status: "In Progress" )
    @app_2 = Application.create(name_of_applicant: 'Joey', street_address: '1150 larimer', city: "Denver", state: "Colorado", zip_code: 80211, description: "i am full of love and have alot of space", status: "Pending" )
    @app_3 = Application.create(name_of_applicant: 'Joey', street_address: '1150 dayton', city: "Aurora", state: "Colorado", zip_code: 80222, description: "i am full of love and have alot of space", status: "Rejected" )
    
  end
  it 'lists all the applications ' do
    
    visit "/applications"

    expect(page).to have_content(@app_1.name_of_applicant)
    expect(page).to have_content(@app_2.name_of_applicant)
    expect(page).to have_content(@app_3.name_of_applicant)
  end
end
