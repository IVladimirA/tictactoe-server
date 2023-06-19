# frozen_string_literal: true

module Jwt
  class IssuerService
    def self.call(user:)
      new_access_token = Jwt::Issuer.call(payload: { user_id: user.id })
      new_refresh_token = Jwt::Issuer.call(payload: {}, token_type: :refresh)

      [new_access_token, new_refresh_token]
    end
  end
end
