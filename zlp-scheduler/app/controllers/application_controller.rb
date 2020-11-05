class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
    
    def require_user
      redirect_to '/login' unless current_user 
    end
    
    def require_student 
  		redirect_to '/' unless current_user and current_user.student? 
    end
    
    def require_admin 
  		redirect_to '/' unless current_user and current_user.admin? 
    end
    def logged_in?
      !current_user.nil?
    end
end