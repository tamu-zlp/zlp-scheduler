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
    
    respond_to do |format|
      subj = request.headers['X-Subj']
      course_num = request.headers['X-Course']
      if course_num.nil? && !subj.nil?
        #send back course numbers
        courses = Course.where(abbreviated_subject: subj)
        course_options = []
        courses.each do |c|
          course_options.push(c.course_number)
        end
        format.json {render json: course_options}
      elsif !course_num.nil? && !subj.nil?
        #send back section numbers
        sections = Course.where(abbreviated_subject: subj, course_number: course_num)
        section_options = []
        sections.each do |s|
          section_options.push(s.section_number)
        end
        format.json {render json: section_options}
      else 
        format.html {render 'add_schedule'}
      end
    end
  end
  
  def create_schedule
    
  end
  
  def closed
    id = session[:user_id]
    @user = User.find(id)
  end
end
