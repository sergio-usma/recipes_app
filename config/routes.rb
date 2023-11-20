Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"

  get 'foods/index'
  get 'foods/show'

end
