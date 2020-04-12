class StudentController < ApplicationController
  def view_terms
    id = session[:user_id]
    @user = User.find(id)
  end
  
  def add_schedule
  end
end
