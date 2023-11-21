Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :foods
  resources :recipe_foods
  resources :recipes
end
