require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :admin do
    resources :clients
    resources :sells
    resources :campaigns
    resources :discounts
    resources :services
    resources :products
    resources :suppliers
  end

  mount Fae::Engine => '/admin'
  mount Sidekiq::Web => '/sidekiq'
end
