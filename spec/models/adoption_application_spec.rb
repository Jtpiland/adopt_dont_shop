require 'rails_helper'

RSpec.describe AdoptionApplication do
  describe 'relationships' do
    it {should have_many :pet_adoption_applications}
    it {should have_many(:pets).through(:pet_adoption_applications)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip_code)}
  end
end
