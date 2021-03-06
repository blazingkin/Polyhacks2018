class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do |controller|
    @current_user = current_user
  end

  private
  def current_user
    @current_user ||= Parent.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
