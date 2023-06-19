# frozen_string_literal: true

module Jwt
  class AuthenticatorService
    class << self
      def call(headers:)
        token = get_token(headers)
        raise StandardError, 'Missing token' if token.blank?

        decoded_token = Jwt::DecoderService.call(token: token)
        user = authenticate_user_from_token(decoded_token)
        raise StandardError, 'Wrong token payload' if user.blank? || !token_valid?(decoded_token)

        user
      end

      private

      def get_token(headers)
        headers['Authorization']&.split('Bearer ')&.last
      end

      def authenticate_user_from_token(decoded_token)
        user = User.find(decoded_token.fetch(:user_id))

        user&.refresh.blank? ? nil : user
      end

      def token_valid?(decoded_token)
        expiration_time = decoded_token.fetch(:exp)
        expiration_time > Time.zone.now.to_i
      end
    end
  end
end
