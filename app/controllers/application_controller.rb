# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authenticate
    @current_user = Jwt::AuthenticatorService.call(headers: request.headers)
  end
end
