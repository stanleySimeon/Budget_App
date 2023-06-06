Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update,]
  
  resources :categories do
    resources :payments
  end

  root 'splashes#index'
  get '/font-awesome', to: 'static#font_awesome'

  get '/login', to: 'devise/sessions#new'
  get '/registrations', to: 'devise/registrations#new'
end
