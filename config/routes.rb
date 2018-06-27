Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :cities, only: %i[index show]
  resources :sessions, only: %i[new create destroy]

  root 'cities#index'
  
  post '/logout',     to: 'sessions#destroy', as: 'logout'
  get '/login',       to: 'sessions#new', as: 'login'
end
