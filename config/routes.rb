Rails.application.routes.draw do
  apipie
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :users, only: [:index, :edit, :destroy] do
    post 'transaction', to: 'users#transaction', as: 'transaction'
  end
end
