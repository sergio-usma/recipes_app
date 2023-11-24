require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestModelCreator.user }
  let(:recipe) { Recipe.create(user: user, preparation_time: 1, cooking_time: 1, name: 'Recipe name', description: 'Recipe description') }

  before do
    sign_in user
    assign(:recipe, recipe)
    render
  end

  it "renders recipe's name" do
    expect(rendered).to match(/#{recipe.name}/)
  end

  it "renders recipe's preparation and cooking time" do
    expect(rendered).to have_text("Preparation time: #{recipe.preparation_time}")
    expect(rendered).to have_text("Cooking time: #{recipe.cooking_time}")
  end
  it "renders recipe's description" do
    expect(rendered).to have_text(recipe.description)
  end
  it "renders recipe's public toggle button" do
    expect(rendered).to have_text('Public')
  end

  it "renders a table with recipe's food details" do
    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('th', text: 'Food')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Value')
    expect(rendered).to have_selector('th', text: 'Actions')
  end
end