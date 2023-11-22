Rails.application.routes.draw do
  root 'public_recipes#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :foods
  get 'recipe_foods/new/:id', to: 'recipe_foods#new', as: 'new_recipe_food'
  resources :recipe_foods
  resources :recipes
  resources :public_recipes, only: [:index]
end
