Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show, :new, :update, :destroy] do
    resources :payments
  end
  root 'home#index'
end
