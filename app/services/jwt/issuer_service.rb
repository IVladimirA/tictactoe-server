# frozen_string_literal: true

module Jwt
  class IssuerService
    def self.call(user:)
      new_access_token = Jwt::EncoderService.call(payload: { user_id: user.id })
      new_refresh_token = Jwt::EncoderService.call(payload: {}, token_type: :refresh)
      user.update(refresh: new_refresh_token)

      [new_access_token, new_refresh_token]
    end
  end
end
