class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user # What is this syntax?
    end
    helper_method :current_user, :logged_in?

    def current_user=(user)
      @current_user = user
      session[:user_id] = user.nil? ? nil : user.id
    end
  # helper_method def logged_in?
  #   !!current_user #double negation to convert to boolean
  # end
  #
  # helper_method def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id] #memoized
  # end
end
