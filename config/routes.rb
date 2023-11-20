Rails.application.routes.draw do
  root to: "foods#index"

  get 'foods/index'
  get 'foods/show'

end
