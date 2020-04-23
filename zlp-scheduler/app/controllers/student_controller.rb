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
    @course_options = [];
    @section_options = [];
    
  end
  
  def update_courses
    # updates artists and songs based on genre selected
    subj = Subject.find(params[:dept_id])
    # map to name and id for use in our options_for_select
    @courses = Course.where(:abbreviated_subject => subj.subject_code)
    @course_options = [];
    @courses.each do |c|
      @course_options.push(c.course_number)
    end
    @course_options = @course_options.uniq
    @course_options.insert(0, "")
  end
  
  def update_sections
    # updates artists and songs based on genre selected
    subj = Subject.find(params[:dept_id])
    course_num = params[:course_num_id]
    # map to name and id for use in our options_for_select
    @sections = Course.where(:abbreviated_subject => subj.subject_code, :course_number => course_num)
    @section_options = [];
    @sections.each do |c|
      @section_options.push(c.section_number)
    end
    @section_options = @section_options.uniq
    @section_options.insert(0, "")
  end
  
  def create_schedule
    
  end
  
  def closed
    id = session[:user_id]
    @user = User.find(id)
  end
end
