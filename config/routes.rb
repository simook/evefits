Evefits::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users

  resources :users do
    resources :fitting
  end

  namespace :api do
    resources :ships
  end

  root :to => "home#index"
end