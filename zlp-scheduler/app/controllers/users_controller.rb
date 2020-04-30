class UsersController < ApplicationController
  
  def new
        @user = User.new
    end
    
    def create 
      @user = User.new(user_params) 
      if @user.save 
        session[:user_id] = @user.id
        if current_user.admin?
          redirect_to view_term_admin_path, :notice => "Logged in !" 
        else
           redirect_to view_terms_path, :notice => "Logged in !" 
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