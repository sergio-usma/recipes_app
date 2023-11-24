# spec/helpers/recipe_foods_helper_spec.rb
require 'rails_helper'

RSpec.describe RecipeFoodsHelper, type: :helper do
  describe '#create_form' do
    let(:foods_items) { [double('Food', name: 'Food 1'), double('Food', name: 'Food 2')] }
    let(:recipe_foods) { double('RecipeFood', quantity: 2) }
    let(:recipe_info) { double('Recipe', id: 1) }

    context 'when foods_items is not empty' do
      it 'renders the form partial' do
        allow(helper).to receive(:render).and_return('Form Partial Content')

        result = helper.create_form(foods_items, recipe_foods, recipe_info)

        expect(result).to eq('Form Partial Content')
        expect(helper).to have_received(:render).with(
          partial: 'recipe_foods/form',
          locals: { foods: foods_items, recipe_food: recipe_foods, recipe: recipe_info }
        )
      end
    end

    context 'when foods_items is empty' do
      it 'returns a message with a link to return' do
        allow(helper).to receive(:link_to).and_return('Return Link')
        allow(helper).to receive(:render).and_return('No foods to add Return Link')

        result = helper.create_form([], recipe_foods, recipe_info)

        expect(result).to eq("<div class='d-flex column-gap-3'>
                    No foods to add
                    Return Link
                  </div>")
        expect(helper).to have_received(:link_to).with('Return', recipe_path(recipe_info.id),
                                                       class: 'btn btn-danger btn-lg')
      end
    end
  end
end
