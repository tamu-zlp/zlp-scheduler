class AdminController < ApplicationController
  
  before_action :require_admin, only: [:view_term_admin, :open_semester, :new_term, :update_term, :manage_cohorts, :add_cohort, :manage_administrators, :view_result]    
  
  
  def view_term_admin
    @term = Term.find_by active: 1;
    @cohorts = @term.cohorts
  end
  
  def open_semester
    @term = Term.find_by active: 1;
  end
  
  def new_term
    if flash[:selected_term_id]
      @term = Term.find(flash[:selected_term_id])
    else
      @term = Term.find_by active: 1;
    end
    @cohorts = Cohort.all
    @cohort_names = []
    @cohorts.each do |s|
      @cohort_names.push(s.name)
    end
  end
  
  def update_term
    if params[:term][:name]
      ##updating active term
      # check for selected cohorts before updating anything
      @term = Term.find(params[:term][:name])
      if not params[:Cohorts]
        flash[:notice] = "Please select at least one cohort."
        redirect_to new_term_path, flash: {selected_term_id: @term.id} and return
      end
      
      Term.update_all active: false
      if @term.update_attributes(:active => true)
        @cohorts = params[:Cohorts]
        @cohorts.each do |c|
          add_cohort = Cohort.where(:name => c)
          @term.cohorts.push(add_cohort)
        end
        @scheduletocourse = ScheduleToCourse.all
        @scheduletocourse.each do |s|
          s.destroy
        end
        @schedules = Schedule.all
        @schedules.each do |s|
          s.destroy
        end
        flash[:notice] = 'Term activated!'
        redirect_to view_term_admin_path
      else
        redirect_to new_term_path
      end
    else
      ##updating open and close dates
      @term = Term.find_by active: 1
      open = DateTime.new(params[:term]['opendate(1i)'].to_i, params[:term]['opendate(2i)'].to_i, params[:term]['opendate(3i)'].to_i, params[:term]['opendate(4i)'].to_i, params[:term]['opendate(5i)'].to_i)
      close = DateTime.new(params[:term]['closedate(1i)'].to_i, params[:term]['closedate(2i)'].to_i, params[:term]['closedate(3i)'].to_i, params[:term]['closedate(4i)'].to_i, params[:term]['closedate(5i)'].to_i)
      LoadCoursesJob.perform_later @term
      #LoadCoursesJob.set(wait_until: 2.hours.until.open).perform_later(@term)
      if @term.update_attributes(:opendate => open) && @term.update_attributes(:closedate => close)
        flash[:notice] = 'Term open dates updated.'
        redirect_to view_term_admin_path
      else
        flash[:notice] = 'Error - please try again.'
        redirect_to new_term_path
      end
    end
  end
  
  def load_terms
    #grab more term data
    Term.ImportTermList!
    #refresh the page
    flash[:notice] = 'Terms loaded!'
    redirect_to new_term_path
  end
  
  def manage_cohorts 
    @cohorts = Cohort.all
  end
  
  def add_cohort
  end
  
  def view_cohort_semester
    @cohort = Cohort.find(params[:id])
    @users = @cohort.users
  end
  
  def delete_cohort
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
    
    flash[:notice] = 'Cohort deleted!'
    redirect_to manage_cohorts_path
  end
  
  def manage_administrators
    @admins = User.where(:role => 'admin')
  end
  
  def add_admin
    @user = User.new
  end
  
  def delete_admin
    @admins = User.where(:role => 'admin')
    if @admins.length == 1
      flash[:warning] = "There must be at least 1 administrator at all times."
      redirect_to manage_administrators_path
    end
    id = session[:user_id]
    @user = User.find(id)
    @admin = User.find(params[:id])
    if @user == @admin
      @admin.destroy
      flash[:warning] = "You have deleted yourself."
      redirect_to "/"
    else
      flash[:notice] = "Administrator deleted!"
      redirect_to manage_administrators_path
    end
  end
  
  
  def optimize
    generator = MatrixGenerator.new
    schedules = generator.get_all_schedules(User.all)
    @scheduler = Scheduler.new(schedules)
    @scheduler.optimize
  end
  
  def view_result
    @cohort = Cohort.find(params[:cohort_id])
    Scheduler_2.Generate_time_slots(@cohort)
    @date_dict = { "M" => "Monday", "T" => "Tuesday", "W" => "Wednesday", "TR" => "Thursday", "F" => "Friday"}
    @results = TimeSlot.where(:was_conflict => false).order(:cost).limit(10)
    @conflict = TimeSlot.where(:was_conflict => true).order(:cost).limit(10)
  end
  
  def view_conflicts
    @cohort = Cohort.find(params[:cohort_id])
  end
end