class StudentController < ApplicationController
  def view_terms
    id = session[:user_id]
    @user = User.find(id)
    @term = Term.find_by active: 1;
  end
  
  def add_schedule
    id = session[:user_id]
    @user = User.find(id)
  end
  
  def closed
    id = session[:user_id]
    @user = User.find(id)
  end
end
