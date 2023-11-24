require 'rails_helper'

RSpec.describe 'general_shopping_lists/index', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestModelCreator.user }
  let(:food) { Food.create(user:, name: 'Onion', measurement_unit: 'gr', price: '1', quantity: 30) }
  let(:recipe) do
    Recipe.create(user:, preparation_time: 1, cooking_time: 1, name: 'Recipe name', description: 'Recipe description')
  end
  let(:recipe_food) { RecipeFood.create(quantity: 100, recipe:, food:) }
  let(:shopping) { { food.id => { name: food.name, quantity: 70, total_price: 70 } } }

  before do
    sign_in user
    assign(:recipes, recipe)
    assign(:required_foods, food)
    assign(:shopping_list, shopping)
    render
  end

  it 'renders the title' do
    expect(rendered).to have_text('General Shopping List')
  end

  it 'it renders the amount of food' do
    expect(rendered).to have_text('Amount of Food Item To Buy: 1')
  end

  it 'renders the table with shopping details' do
    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('th', text: 'Food')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Price')
    expect(rendered).to have_selector('td', text: 'Onion')
    expect(rendered).to have_selector('td', text: '70')
    expect(rendered).to have_selector('td', text: '70')
  end
end
