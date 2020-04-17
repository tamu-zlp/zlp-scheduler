class AdminController < ApplicationController
  def view_term_admin
  end
  
  def open_semester
  end
  
  def new_term
    @term = Term.find_by active: 1;
  end
  
  def update_term
    @term = Term.find(params[:term][:name])
    Term.update_all active: false
    if @term.update_attributes(:active => true)
      redirect_to view_term_admin_path
      flash[:success] = 'Term activated!'
    else
      redirect_to new_term_path
    end
  end
  
  def manage_cohorts 
  end
  
  def add_cohort
  end
  
  def manage_administrators
  end
  
end