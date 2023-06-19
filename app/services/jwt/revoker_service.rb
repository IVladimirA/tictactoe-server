# frozen_string_literal: true

module Jwt
  class RevokerService
    def self.call(user:)
      user.update(refresh: nil)
    end
  end
end
