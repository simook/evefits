Evefits::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users

  resources :users

  resources :fitting

  namespace :api do
    resources :ships, :only => [:index, :show]
    resources :modules, :only => [:index, :show, :types] do
      member do
        get 'types'
      end
    end
    resources :evecentral, :only => [:marketstat] do
      member do
        get 'marketstat'
      end
    end
    resources :charges, :only => [:index]
  end

  root :to => "home#index"
end