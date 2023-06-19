# frozen_string_literal: true

module Jwt
  class EncoderService
    class << self
      def call(payload:, token_type: :access)
        payload[:exp] =
          (issued_at + (
            token_type == :access ? Jwt::Helper.access_expire_after : Jwt::Helper.refresh_expire_after)
          ).to_i
        ::JWT.encode(payload, Jwt::Helper.secret)
      end

      private

      def issued_at
        Time.zone.now
      end
    end
  end
end
