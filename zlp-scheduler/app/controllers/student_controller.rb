class StudentController < ApplicationController
  def view_terms
    id = session[:user_id]
    @user = User.find(id)
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
