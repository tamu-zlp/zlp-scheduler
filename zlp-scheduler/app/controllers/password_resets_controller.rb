class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    @user.send_password_reset if @user
    redirect_to '/', :notice => "Email sent with password reset instructions"
  end
  
  def edit
  end
  
  def update
  if @user.update_attributes(user_params)
      redirect_to '/', :notice => "Password has been reset!"
    else
      render :edit
    end
  end
  
  private
    def get_user
      @user = User.find_by_password_reset_token(params[:id])
    end

    def valid_user
      unless @user and @user.password_reset_sent_at >= 2.hours.ago
        flash[:warning] = "Password reset has expired."
        redirect_to new_password_reset_path
        # redirect_to '/'
      end
    end
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  
end
