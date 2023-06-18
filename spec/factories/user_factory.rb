# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'JohnKiller' }
    email { 'test@gmail.com' }
    passHash { 'hash' }
    guest { false }
  end

  factory :guest_user, parent: :user do
    username { '' }
    email { '' }
    passHash { '' }
    guest { true }
  end
end
