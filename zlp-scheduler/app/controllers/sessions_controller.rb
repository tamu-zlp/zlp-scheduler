class SessionsController < ApplicationController
    
    def create
        user= User.find_by(email:login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            @term = Term.find_by active: 1
            if @term.opendate.nil? 
                @term.update_attributes(:opendate => DateTime.yesterday)
                @term.update_attributes(:closedate => DateTime.yesterday)
            end
            if DateTime.current >= @term.opendate && DateTime.current < @term.closedate
                redirect_to '/student/view_terms'
            else
                redirect_to '/student/closed'
            end
        else
            flash[:login_errors]= ['invalid credentials']
            redirect_to '/'
        end
    end
    
    
    private
        def login_params
            params.require(:login).permit(:email, :password)
        end
end
