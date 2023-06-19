# frozen_string_literal: true

module Jwt
  class EncoderService
    class << self
      def call(payload:, token_type: :access)
        payload[:exp] = issued_at + (token_type == :access ? access_expire_after : refrsh_expire_after)
        JWT.encode(payload, Jwt::Helper.secret)
      end

      private

      def issued_at
        Time.current.now
      end
    end
  end
end
