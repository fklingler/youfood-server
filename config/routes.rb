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
    end
  end

  constraints :hot => /^api\./ do
    namespace :api, :path => '' do
      match 'restaurant' => 'restaurant#show'
    end
  end
end
