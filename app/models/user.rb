# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true
  validates :passHash, presence: true
  validates :guest, presence: true
end
