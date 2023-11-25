require 'rails_helper'

RSpec.describe 'public_recipes/index', type: :view do
  let(:user) { TestModelCreator.user }

  before do
    user.skip_confirmation!
    user.save
    assign(:recipes, [])
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it 'renders a alert if there are no public recipes' do
    print user.id
    expect(rendered).to match(/There is no public recipe./)
  end

  it 'renders public recipes if they are public' do
    recipe = Recipe.create(public: true, preparation_time: 1, cooking_time: 1, name: 'Recipe name',
                           description: 'Test', user:)
    assign(:recipes, [recipe])
    render

    expect(rendered).to have_selector('.alert.alert-primary.text-center')
    expect(rendered).to have_link(recipe.name, href: recipe_path(recipe.id))
    expect(rendered).to have_content("By: #{recipe.user.name}")
  end
end
