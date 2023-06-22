# frozen_string_literal: true

Rails.application.routes.draw do
  resources(:users, only: %i[create])
  get('users/me', to: 'users#me')
  post('logout', to: 'users#logout')
  post('auth', to: 'users#login')
  post('refresh', to: 'users#refresh')

  resources(:games, only: %i[create])
  get('games/state', to: 'games#check_state')
  post('games/turn', to: 'games#turn')
end
