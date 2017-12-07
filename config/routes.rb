Rails.application.routes.draw do
  
  get 'order_line_item_histories/index'

  root 'dashboard#index'

  resources :customers
  resources :products
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
