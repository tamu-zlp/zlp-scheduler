class SessionsController < ApplicationController
    def new 
    end
    
    def create
      @user = User.find_by_email(params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        @term = Term.find_by active: 1
        if @term.opendate.nil? 
          @term.update_attributes(:opendate => DateTime.yesterday)
          @term.update_attributes(:closedate => DateTime.yesterday)
        end
        if current_user.admin?
          redirect_to view_term_admin_path, :notice => "Logged in !" 
        else
          if DateTime.current >= @term.opendate && DateTime.current < @term.closedate
            redirect_to '/student/view_terms', :notice => "Logged in !" 
          else
            redirect_to '/student/closed', :notice => "Logged in !" 
          end
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

