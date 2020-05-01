class AdminController < ApplicationController
  
  before_action :require_admin, only: [:view_term_admin, :open_semester, :new_term, :update_term, :manage_cohorts, :add_cohort, :manage_administrators]    
  
  
  def view_term_admin
    @term = Term.find_by active: 1;
  end
  
  def open_semester
    @term = Term.find_by active: 1;
  end
  
  def new_term
    @term = Term.find_by active: 1;
  end
  
  def update_term
    if params[:term][:name]
      ##updating active term
      @term = Term.find(params[:term][:name])
      Term.update_all active: false
      if @term.update_attributes(:active => true)
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
  end
  
  def add_cohort
  end
  
  def manage_administrators
  end
  
end