Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  post 'transaction', to: 'users#transaction', as: 'transaction'
end
