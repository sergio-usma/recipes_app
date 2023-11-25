require 'rails_helper'

RSpec.describe RecipesHelper, type: :helper do
  let(:user) { TestModelCreator.user }
  let(:recipe) { FactoryBot.create(:recipe, user_id: user.id) }

  describe '#trim_text' do
    it 'trims text to a maximum length of 85 characters' do
      text = 'This is a long text that needs to be trimmed to a maximum length of 85 characters.'
      trimmed_text = helper.trim_text(text)
      expect(trimmed_text.length).to be <= 85
    end

    it 'does not trim text that is already 85 characters or less' do
      short_text = 'Short text within 85 characters.'
      trimmed_text = helper.trim_text(short_text)
      expect(trimmed_text).to eq(short_text)
    end
  end

  describe '#delete_button' do
    it 'returns a delete button if the user can destroy the recipe' do
      allow(helper).to receive(:can?).with(:destroy, recipe).and_return(true)
      delete_button = helper.delete_button(recipe)
      expect(delete_button).to include('Remove')
    end

    it 'returns an empty string if the user cannot destroy the recipe' do
      allow(helper).to receive(:can?).with(:destroy, recipe).and_return(false)
      delete_button = helper.delete_button(recipe)
      expect(delete_button).to be_empty
    end
  end

  describe '#recipe_actions' do
    it 'returns modify and remove links if the user can update and destroy the food' do
      food = FactoryBot.create(:food, user:)
      recipe_food = FactoryBot.create(:recipe_food, recipe:, food:)
      allow(helper).to receive(:can?).with(:update, food).and_return(true)
      allow(helper).to receive(:can?).with(:destroy, food).and_return(true)

      recipe_actions = helper.recipe_actions(food, recipe_food)
      expect(recipe_actions).to include('Modify')
      expect(recipe_actions).to include('Remove')
    end

    it 'returns a message if the user cannot update and destroy the food' do
      food = FactoryBot.create(:food, user:)
      recipe_food = FactoryBot.create(:recipe_food, recipe:, food:)
      allow(helper).to receive(:can?).with(:update, food).and_return(false)
      allow(helper).to receive(:can?).with(:destroy, food).and_return(false)

      recipe_actions = helper.recipe_actions(food, recipe_food)
      expect(recipe_actions).to include('No actions permitted')
    end
  end
end
