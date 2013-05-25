Evefits::Application.routes.draw do
  get "effects/show"

  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users

  resources :users

  resources :fitting

  namespace :api do
    resources :ships, :only => [:index, :show]
    resources :modules do
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