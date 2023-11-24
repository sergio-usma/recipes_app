require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestModelCreator.user }

  before do
    sign_in user
    assign(:user, user)
    assign(:recipe, user.recipes.new)
    render
  end

  it 'renders the title' do
    expect(rendered).to match(/Create new recipe/)
  end

  it 'renders the label and input for name' do
    expect(rendered).to have_selector('label', text: "Recipe's name:")
    expect(rendered).to have_selector('input', id: 'recipe_name')
  end

  it 'renders the label and input for preparation time' do
    expect(rendered).to have_selector('label', text: 'Preparation time(hrs):')
    expect(rendered).to have_selector('input', id: 'recipe_preparation_time')
  end

  it 'renders label and input for cooling time' do
    expect(rendered).to have_selector('label', text: 'Cooking time(hrs):')
    expect(rendered).to have_selector('input', id: 'recipe_cooking_time')
  end

  it 'renders label and input for description' do
    expect(rendered).to have_selector('label', text: 'Description:')
    expect(rendered).to have_selector('textarea', id: 'recipe_description')
  end

  it 'renders submit and cancel buttons' do
    expect(rendered).to have_text('Create')
    expect(rendered).to have_selector('a', text: 'Cancel')
  end
end
