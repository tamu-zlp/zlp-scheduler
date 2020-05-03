class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def add_cohort
    @cohort = Cohort.new
  end
  
  def download_excel_example
    send_file "#{Rails.root}/app/assets/docs/example.xlsx", x_sendfile: true
  end
  
  def edit_user
    @user = User.find(params[:id])
  end
  
  def patch_user
    @user = User.find(params[:id])
    @user.firstname = params[:user][:firstname]
    @user.lastname = params[:user][:lastname]
    @user.uin = params[:user][:uin]
    @user.email = params[:user][:email]
    if @user.save
      if @user.role == 'student'
        flash[:notice] = "Student updated!"
        redirect_to manage_cohorts_path
      else #admin
        flash[:notice] = "Administrator updated!"
        redirect_to manage_administrators_path
      end
    else
      flash[:warning] = "Error"
      redirect_to edit_user_path(@user)
    end
  end
  
  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    
    flash[:notice] = 'User deleted!'
    redirect_to :back
  end
  
  def import_from_excel
     file = params[:file]
     @cohort = Cohort.new
     @cohort.update_attributes(:name => params[:name])
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      ## We are iterating from row 2 because we have left row one for header
      (2..spreadsheet.last_row).each do |i|
        @user = User.new
        puts spreadsheet.row(i)[0]
        @user.firstname = spreadsheet.row(i)[0]
        @user.lastname = spreadsheet.row(i)[1]
        @user.uin = spreadsheet.row(i)[2]
        @user.email = spreadsheet.row(i)[3]
        @user.role = 'student'
        @user.password = "Temp"
        @user.save
        @cohort.users.push(@user)
    end
    flash[:notice] = "Records Imported"
    redirect_to manage_cohorts_path
    end
  end
  
  def create
    @user = User.new
    @user.firstname = params[:user][:firstname]
    @user.lastname = params[:user][:lastname]
    @user.email = params[:user][:email]
    @user.uin = params[:user][:uin]
    @user.role = 'admin'
    @user.password = "Temp"
    @user.save
    redirect_to manage_administrators_path
  end

    
    def update_user
      #check if there is a record for them in users
      @user = User.where(:email => params[:user][:email], :uin => params[:user][:uin], :role => params[:user][:role])
      if @user.empty?
        flash[:warning] = "The director has not registered your email."
        redirect_to '/signup' 
      else
        @user[0].update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        @user[0].save
        session[:user_id] = @user[0].id
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
      end
    end  
  
    private
      def user_params
        params.require(:user).permit(:role, :uin, :lastname, :firstname, :email, :password, :password_confirmation)
      end 
    
end