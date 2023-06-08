Rails.application.routes.draw do
  root 'home#index'
  get 'products', to: 'products#index'
  get 'product/:id', to: 'products#show', as: 'product'

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create]

  namespace 'admin' do
    resources :products, only: %i[index new create edit update destroy]
  end
end
