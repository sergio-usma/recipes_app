require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestModelCreator.user }
  let(:recipe) do
    Recipe.create(user:, preparation_time: 1, cooking_time: 2, name: 'Recipe name', description: 'Recipe description')
  end

  before do
    assign(:user, user)
    assign(:recipes, [recipe])
    render
  end

  it "User's and recipe's name should be visible" do
    expect(rendered).to match(/#{user.name}'s Recipes/)
    expect(rendered).to match(/#{recipe.name}/)
  end

  it 'Recipe description should be visible' do
    expect(rendered).to have_text(recipe.description)
  end

  it 'Create new recipe button should be visible' do
    expect(rendered).to have_text('Create new recipe')
  end
end
