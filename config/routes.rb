Rails.application.routes.draw do

  root to: 'tacocopter#index'

  resources :tacocopter, only: [:index, :show]

end
