class SessionsController < ApplicationController
    def new 
    end
    
    def create
      @user = User.find_by_email(params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        if current_user.admin?
          redirect_to '/managecohorts', :notice => "Logged in !" 
        else
           redirect_to '/viewterms', :notice => "Logged in !" 
        end
      else
        flash[:login_errors]= ['Email or password is invalid']
        redirect_to '/'
      end 
    end 
    
    def destroy 
      session[:user_id] = nil 
      redirect_to '/login', :notice => "Logged out !" 
    end

end
