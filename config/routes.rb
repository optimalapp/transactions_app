# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  apipie
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :users, only: %i[index edit update destroy]
  resources :transactions, only: %i[create show]
end
