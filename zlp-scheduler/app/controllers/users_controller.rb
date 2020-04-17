class UsersController < ApplicationController
  def index
  end
  
  def create
    user = User.new(user_params) 
    if user.save
        session[:user_id] = user.id
        @term = Term.find_by active: 1
        if DateTime.current >= @term.opendate && DateTime.current < @term.closedate
          redirect_to '/student/view_terms'
        else
          redirect_to '/student/closed'
        end
    else
        flash[:register_errors] = user.errors.full_messages
        redirect_to '/registerpage'
    end
  end
  
  def signout
    # clear the authentication toke when the user manually signs out
    user = User.find_by_id(session[:user_id])

    if user
      #update_authentication_token(user, nil)
      user.save
      session[:user_id] = nil
      flash[:notice] = "You have been signed out."
    else
      redirect_to '/'
    end
  end
  
  # HTTP get
  def forgot_password
    @user = User.new
  end

  # HTTP put
  def send_password_reset_instructions
    
      user = User.find_by(email:user_params[:email])
    

    if user
      user.password_reset_token = SecureRandom.urlsafe_base64
      user.password_expires_after = 24.hours.from_now
      user.save
      UserMailer.reset_password_email(user).deliver
      flash[:notice] = 'Password instructions have been mailed to you.  Please check your inbox.'
      redirect_to '/'
    else
      @user = User.new
      # put the previous value back.
      @user.username = params[:user][:username]
      @user.errors[:username] = 'is not a registered user.'
      render :action => "forgot_password"
    end
  end
  
  
   # The user has landed on the password reset page, they need to enter a new password.
  # HTTP get
  def password_reset
    token = params.first[0]
    @user = User.find_by_password_reset_token(token)

    if @user.nil?
      flash[:error] = 'You have not requested a password reset.'
      redirect_to :root
      return
    end

    if @user.password_expires_after < DateTime.now
      clear_password_reset(@user)
      @user.save
      flash[:error] = 'Password reset has expired.  Please request a new password reset.'
      redirect_to :forgot_password
    end
  end

  # The user has entered a new password.  Need to verify and save.
  # HTTP put
  def new_password
    username = params[:user][:username]
    @user = User.find_by_username(username)

    if verify_new_password(params[:user])
      @user.update(params[:user])
      @user.password = @user.new_password

      if @user.valid?
        clear_password_reset(@user)
        @user.save
        flash[:notice] = 'Your password has been reset.  Please sign in with your new password.'
        redirect_to :sign_in
      else
        render :action => "password_reset"
      end
    else
      @user.errors[:new_password] = 'Cannot be blank and must match the password verification.'
      render :action => "password_reset"
    end
  end
  
  
  private
    def user_params
      params.require(:user).permit(:uin,:lastname, :firstname, :email, :password, :password_confirmation)
    end    
  
  def clear_password_reset(user)
    user.password_expires_after = nil
    user.password_reset_token = nil
  end

  def verify_new_password(passwords)
    result = true

    if passwords[:new_password].blank? || (passwords[:new_password] != passwords[:new_password_confirmation])
      result=false
    end

    result
  end
  
end
