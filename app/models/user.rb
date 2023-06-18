# frozen_string_literal: true

class User < ApplicationRecord
  validates :guest, inclusion: { in: [true, false] }
  validates :username, presence: true, if: -> { guest == false }
  validates :email, presence: true, if: -> { guest == false }
  validates :passHash, presence: true, if: -> { guest == false }
end
