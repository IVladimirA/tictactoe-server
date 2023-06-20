# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def authenticate
    @current_user = Jwt::AuthenticatorService.call(headers: request.headers)
  rescue JWT::ExpiredSignature, StandardError
    render(json: {}, status: :unauthorized)
  end
end
