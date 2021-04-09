require 'rails_helper'

RSpec.describe ApplicationPet, type: :model do
  describe 'relationships' do
    it { should belong_to(:pet) }
    it { should belong_to(:application) }
  end
  describe 'validations' do
    it { should validate_presence_of(:status) }
  end
end
