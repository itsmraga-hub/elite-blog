class Api::V1::ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  before_action :authentication_with_token
  before_action :authenticate_user!

  private

  def authentication_with_token
    return unless params[:api_token]

    user = User.find_by_api_token(params[:api_token])
    sign_in(user)
  end
end
