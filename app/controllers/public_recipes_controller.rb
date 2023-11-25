# rubocop:disable Layout/LineLength
class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, :foods, :recipe_foods).where(public: true).references(:user, :foods,
                                                                                            :recipe_foods).order(created_at: :desc)
  end
end
# rubocop:enable Layout/LineLength
