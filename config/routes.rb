Rails.application.routes.draw do
  post 'transaction', to: 'merchants#transaction', as: 'transaction'
end
