# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :forms
      resources :questions, only: %i[create update destroy]
      resources :answers, only: %i[index show create destroy]
    end
  end
end
