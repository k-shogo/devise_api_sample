class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user_from_token!, if: -> {params[:token].present?}

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.json { render json: {message: exception.message}, status: :unauthorized }
    end
  end

  def authenticate_user_from_token!
    if user = User.find_by(authentication_token: params[:token].presence)
      sign_in user, store: false
    end
  end
end
