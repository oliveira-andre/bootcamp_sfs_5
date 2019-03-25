Rails.application.routes.draw do
  get 'exchanges/index'
  get 'convert', to: 'exchanges#convert'

  root 'exchanges#index'
end
