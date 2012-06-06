class ApiDomain
  def self.matches?(request)
    request.subdomains(0).first == 'api'
  end
end

class FrontofficeDomain
  def self.matches?(request)
    request.subdomains(0).first != 'api'
  end
end

Server::Application.routes.draw do
  constraints(FrontofficeDomain) do
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

  constraints(ApiDomain) do
    namespace :api, :path => '' do
      match 'menu' => 'menu#show'
    end
  end
end
