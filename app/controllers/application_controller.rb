# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cpp, if: :devise_controller?
  before_action :basic_auth
  before_action :chef_caution, if: :devise_controller?
  before_action :user_caution, if: :devise_controller?

  private

  def cpp
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name zip_code prefecture_id district street phone_number])
  end

  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id])
    current_cart ||= Cart.create
    session[:cart_id] = current_cart.id
    current_cart
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def chef_caution
    flash[:notice] = 'ユーザー用アカウントを一度ログアウトしてから、シェフ用アカウント作成に進んでください' if user_signed_in?
  end

  def user_caution
    flash[:notice] = 'シェフ用アカウントを一度ログアウトしてから、サインアップに進んでください' if chef_signed_in?
  end
end
