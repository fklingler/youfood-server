Server::Application.routes.draw do
  devise_for :employees
  devise_for :devices, :only => nil #only auth token

  constraints :host => /^(?!api\.)/ do
    namespace :frontoffice, :path => '' do
      root :to => 'restaurants#index'

      resources :restaurants do
        resources :zones
        resources :tables
        resources :waiters
      end

      resources :menus
      resources :product_types
      resources :products

      resources :employees

      match 'monitoring' => 'monitoring#index'
    end
  end

  constraints :host => /^api\./ do
    namespace :api, :path => '' do
      match 'restaurant' => 'restaurant#show', :via => :get

      resources :orders, :only => [:index, :create, :update]

      match 'register' => 'device#register', :via => :post
    end
  end
end
