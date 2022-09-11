Rails.application.routes.draw do
  resources :products
  resources :designs
  get 'welcome/index'
  resources :favorites

  resources :cart_items
  post 'cart_items/increase/:id' => 'cart_items#increase_cart_item_count'
  post 'cart_items/decrease/:id' => 'cart_items#decrease_cart_item_count'
  resources :transaction_items
  resources :transaction_orders
  post 'transaction_orders/transfer/pay/:id' => 'transaction_orders#transfer_order_status_pay'
  post 'transaction_orders/transfer/deliver/:id' => 'transaction_orders#transfer_order_status_deliver'
  post 'transaction_orders/transfer/get/:id' => 'transaction_orders#transfer_order_status_get'
  resources :colors
  resources :product_types
  resources :sizes
  devise_for :users
  resources :users




  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
