require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.new(name: 'Timmy') }
  let(:recipe) { Recipe.new(name: 'Recipe', description: 'Recipe Description', user: user) }

  before :each do
    user.save
    recipe.save
  end

  describe 'Validations' do
    it 'Name has to be present to be valid' do
      expect(Recipe.new(name: '', user_id: user.id, public: true)).not_to be_valid
    end

    it 'Preparation time has to be greater than 0' do
      expect(Recipe.new(preparation_time: 0, user_id: user.id, public: true)).not_to be_valid
      expect(Recipe.new(preparation_time: -2, user_id: user.id, public: true)).not_to be_valid
    end

    it 'Cooking time has to be greater than 0' do
      expect(Recipe.new(cooking_time: 0, user_id: user.id, public: true)).not_to be_valid
      expect(Recipe.new(cooking_time: -2, user_id: user.id, public: true)).not_to be_valid
    end

    it 'Description has to be present to be valid' do
      expect(Recipe.new(description: '', user_id: user.id, public: true)).not_to be_valid
    end

    it 'User_id has to be present to be valid' do
      expect(Recipe.new(name: 'Recipe name', description: 'Recipe description', public: true)).not_to be_valid
    end
  end

  describe 'Associations' do
    it { expect(Recipe.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(Recipe.reflect_on_association(:recipe_foods).macro).to eq(:has_many) }
  end
end
