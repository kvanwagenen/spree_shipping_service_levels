Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :stock_locations do
      resources :shipping_service_levels
      resources :shipping_method_offerings
    end
  end
end
