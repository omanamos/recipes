class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  helper_method :require_admin, :current_user_session, :current_user, :logged_in?

  private
    def require_admin
      unless current_user_session.user.role == "admin"
        flash[:error] = "You are not authorized to access this area."
        redirect_to "/"
      end
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this area."
        redirect_to "/"
      end
    end
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def logged_in?
    	defined?(current_user_session) && defined?(current_user_session.user)
    end
end
