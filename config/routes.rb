# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  apipie
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :users, only: %i[index edit update destroy] do
    post 'transaction', to: 'users#transaction', as: 'transaction'
  end

  resources :transactions, only: [:show] do
  end
end
