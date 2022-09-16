Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :payments
  end
  root 'splashes#index'
end
