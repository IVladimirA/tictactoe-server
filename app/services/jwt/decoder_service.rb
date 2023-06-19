# frozen_string_literal: true

module Jwt
  class DecoderService
    def self.call(token:, verify: true)
      JWT.decode(token, Jwt::Helper.secret, verify)[0].symbolize_keys
    end
  end
end
