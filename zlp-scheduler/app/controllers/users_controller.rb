class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
    
    def create 
      @user = User.new(user_params) 
      if @user.save 
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
        flash[:register_errors] = @user.errors.full_messages
        redirect_to '/signup' 
      end 
    end  
  
    private
      def user_params
        params.require(:user).permit(:role, :uin, :lastname, :firstname, :email, :password, :password_confirmation)
      end 
      
end