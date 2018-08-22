Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  devise_for :admin_users

  namespace :admin do
    resources :users
  end
end
