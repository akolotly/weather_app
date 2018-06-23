Rails.application.routes.draw do
  resources :city, only: %i[index show]

  root 'cities#index'
end
