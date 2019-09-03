Rails.application.routes.draw do
  post 'transaction', to: 'users#transaction', as: 'transaction'
end
