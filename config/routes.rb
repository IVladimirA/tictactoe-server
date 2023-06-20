# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"
  resources(:users, only: %i[create])
  post('logout', to: 'users#logout')
  get('auth', to: 'users#login')
  post('refresh', to: 'users#refresh')
end
