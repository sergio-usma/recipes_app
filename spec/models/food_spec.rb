require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Validations' do
    it {
      expect(Food.new(name: '', price: 2, quantity: 10, measurement_unit: 'gr')).to_not be_valid
    }

    it {
      expect(Food.new(name: 'Carrot', price: 2, quantity: 10, measurement_unit: '')).to_not be_valid
    }

    it {
      expect(Food.new(name: 'Carrot', quantity: 10, measurement_unit: 'gr')).to_not be_valid
    }

    it {
      expect(Food.new(name: 'Carrot', price: 2, measurement_unit: 'gr')).to_not be_valid
    }
  end

  describe 'Associations' do
    it { expect(Food.reflect_on_association(:recipe_foods).macro).to eq(:has_many) }
    it { expect(Food.reflect_on_association(:recipes).macro).to eq(:has_many) }
  end
end
