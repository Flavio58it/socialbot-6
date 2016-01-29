class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper





  def require_login
    if logged_out?
      flash[:danger] = "You must be logged in to do that"
      redirect_to root_url
    end
  end

  def redirect_logged_in
    redirect_to products_url if logged_in?
  end

end
