Rails.application.routes.draw do
  root 'foods#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :foods
  get 'recipe_foods/new/:id', to: 'recipe_foods#new', as: 'new_recipe_food'
  resources :recipe_foods
  resources :recipes
  resources :general_shopping_lists, only: [:index]
  resources :public_recipes, only: [:index]
end
