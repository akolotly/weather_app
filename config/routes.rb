Rails.application.routes.draw do
  resources :cities, only: %i[index show]

  root 'cities#index'
end
