Rails.application.routes.draw do
  root 'home#index'
  get 'products', to: 'products#index'
  get 'product/:id', to: 'products#show', as: 'product'

  namespace 'admin' do
    resources :products, only: %i[index new create edit update destroy]
    # patch 'products/:id', to: 'products#update', as: 'update_product'
  end
end
