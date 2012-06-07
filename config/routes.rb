Server::Application.routes.draw do
  constraints :host => /^(?!api\.)/ do
    namespace :frontoffice, :path => '' do
      root :to => 'restaurants#index'

      resources :restaurants do
        resources :zones
        resources :tables
      end

      resources :menus
      resources :product_types
      resources :products
    end
  end

  constraints :hot => /^api\./ do
    namespace :api, :path => '' do
      match 'menu' => 'menu#show'
    end
  end
end
