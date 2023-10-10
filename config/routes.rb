# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'products', to: 'products#index'
  get 'product/:id', to: 'products#show', as: 'product'

  resources :folders

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]

  namespace 'admin' do
    resources :products, only: %i[index new create edit update destroy]
  end
end
