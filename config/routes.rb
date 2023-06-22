# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"
  resources(:users, only: %i[create])
  get('me', to: 'users#me')
  post('logout', to: 'users#logout')
  post('auth', to: 'users#login')
  post('refresh', to: 'users#refresh')
end
