class AdminController < ApplicationController
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
        redirect_to view_term_admin_path
        flash[:success] = 'Term activated!'
      else
        redirect_to new_term_path
      end
    else
      ##updating open and close dates
      @term = Term.find_by active: 1
      open = DateTime.new(params[:term]['opendate(1i)'].to_i, params[:term]['opendate(2i)'].to_i, params[:term]['opendate(3i)'].to_i, params[:term]['opendate(4i)'].to_i, params[:term]['opendate(5i)'].to_i)
      close = DateTime.new(params[:term]['closedate(1i)'].to_i, params[:term]['closedate(2i)'].to_i, params[:term]['closedate(3i)'].to_i, params[:term]['closedate(4i)'].to_i, params[:term]['closedate(5i)'].to_i)
      if @term.update_attributes(:opendate => open) && @term.update_attributes(:closedate => close)
        redirect_to view_term_admin_path
        flash[:success] = 'Term open dates updated.'
      else
        redirect_to new_term_path, alert: 'Error.'
      end
    end
  end
  
  def manage_cohorts 
  end
  
  def add_cohort
  end
  
  def manage_administrators
  end
  
end