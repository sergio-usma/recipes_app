class GeneralShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(user: current_user).references(:user)
    required_foods = calculate_required_foods

    @total_price = 0
    @shopping_list = {}
    required_foods.each do |food_id, quantity|
      food = Food.find(food_id)
      next unless food.quantity < quantity

      final_quantity = quantity - food.quantity
      @total_price += final_quantity * food.price

      @shopping_list[food_id] = {
        name: food.name,
        quantity: final_quantity,
        unit_price: food.price,
        total_price: final_quantity * food.price
      }
    end
  end

  private

  def calculate_required_foods
    required_foods = {}
    @recipes.each do |recipe|
      RecipeFood.includes(:recipe).where(recipe:).references(:recipe).each do |recipe_food|
        if required_foods[recipe_food.food_id].nil?
          required_foods[recipe_food.food_id] = recipe_food.quantity
        else
          required_foods[recipe_food.food_id] += recipe_food.quantity
        end
      end
    end

    required_foods
  end
end
