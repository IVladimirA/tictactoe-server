# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'JohnKiller' }
    email { 'test@gmail.com' }
    password_hash { BCrypt::Password.create('password') }
    guest { false }
  end

  factory :guest_user, parent: :user do
    username { '' }
    email { '' }
    password_hash { '' }
    guest { true }
  end
end
