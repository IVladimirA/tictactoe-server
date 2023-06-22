# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate, only: %i[me logout]

  def create
    user = Users::CreatorService.call(user_params: user_params)
    access, refresh = Jwt::IssuerService.call(user: user)
    render json: { access: access, refresh: refresh, username: user.username, user_id: user.id, wins: user.wins, loses: user.loses }
  end

  def me
    render json: { username: @current_user.username, user_id: @current_user.id, wins: @current_user.wins, loses: @current_user.loses }
  end

  def logout
    Jwt::RevokerService.call(user: @current_user)

    render(json: { status: 'success' }, state: :success)
  end

  def login
    user = User.find_by(email: params.dig(:user, :email))

    return render(json: { error: 'wrong password' }, status: :unauthorized) if user.password != params.dig(:user,
                                                                                                           :password)

    access, refresh = Jwt::IssuerService.call(user: user)
    render json: { access: access, refresh: refresh, username: user.username, user_id: user.id, wins: user.wins, loses: user.loses }
  end

  def refresh
    user = User.find_by(refresh: params[:refresh])

    return render(json: {}, status: :forbidden) if user.blank?

    access, refresh = Jwt::IssuerService.call(user: user)
    render json: { access: access, refresh: refresh }
  end

  private

  def user_params
    params.require(:user).permit(:guest, :username, :email, :password)
  end
end
