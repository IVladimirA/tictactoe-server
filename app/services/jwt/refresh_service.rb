# frozen_string_literal: true

module Jwt
  class RefresherService
    def self.call(user:)
      new_access_token, new_refresh_token = Jwt::Issuer.call(user)
      user.update(refresh: new_refresh_token)
      [new_access_token, new_refresh_token]
    end
  end
end
