# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate, only: %i[me logout]

  def create
    user = Users::CreatorService.call(user_params: user_params)
    access, refresh = Jwt::IssuerService.call(user: user)
    render json: { access: access, refresh: refresh, username: user.username }
  end

  def me
  end

  def logout
    Jwt::RevokerService.call(user: @current_user)

    render json: { status: 'success' }
  end

  def login
    user = User.find_by(email: params.dig(:user, :email))

    return render(json: { error: 'wrong password' }, status: :unauthorized) if user.password != params.dig(:user, :password)

    access, refresh = Jwt::IssuerService.call(user: user)
    render json: { access: access, refresh: refresh, username: user.username }
  end

  def refresh
    user = User.find_by(refresh: params[:refresh])

    return render(json: {}, status: :forbidden) if user.blank?

    access, refresh = Jwt::IssuerService.call(user: user)
    render json: { access: access, refresh: refresh }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
