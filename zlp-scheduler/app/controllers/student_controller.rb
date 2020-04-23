class StudentController < ApplicationController
  def view_terms
    id = session[:user_id]
    @user = User.find(id)
    @term = Term.find_by active: 1;
  end
  
  def add_schedule
    id = session[:user_id]
    @user = User.find(id)
    @schedule = Schedule.new
    
    @term = Term.find_by active: 1;
    @subjects = @term.subjects
    @subject_options = [];
    @subjects.each do |s|
      @subject_options.push(s.subject_code)
    end
  end
  
  def create_schedule
    
  end
  
  def closed
    id = session[:user_id]
    @user = User.find(id)
  end
end
