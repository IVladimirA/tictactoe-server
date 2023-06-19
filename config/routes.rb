# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"
  resources(:users, only: %i[new create])
  delete('auth', to: 'users#logout')
  get('auth', to: 'users#login')
  get('refresh', to: 'users#refresh')
end
