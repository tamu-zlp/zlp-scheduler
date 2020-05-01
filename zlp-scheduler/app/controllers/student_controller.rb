class StudentController < ApplicationController
  
   before_action :require_student, only: [:view_terms, :add_schedule, :update_courses, :update_sections, :create_schedule, :view_schedule,:delete_schedule]  
  
  def view_terms
    id = session[:user_id]
    @user = User.find(id)
    @term = Term.find_by active: 1;
    if @user.schedules
      @schedules = @user.schedules
    else 
      @schedules = []
    end
  end
  
  def add_schedule
    id = session[:user_id]
    @user = User.find(id)
    @schedule = Schedule.new
    
    @term = Term.find_by active: 1;
    @subjects = @term.subjects
    @subjects = @subjects.uniq
    @course_options = [];
    @section_options = [];
    
  end
  
  def update_courses
    @select_id = params[:id]
    if params[:dept_id].empty?
      @course_options = [].insert(0, "")
    else 
      subj = Subject.find(params[:dept_id])
      # map to name and id for use in our options_for_select
      @term = Term.find_by active: 1;
      @courses = Course.where(:abbreviated_subject => subj.subject_code, :term_id => @term.id)
      @course_options = [];
      @courses.each do |c|
        @course_options.push(c.course_number)
      end
      @course_options = @course_options.uniq
      @course_options.insert(0, "")
    end
  end
  
  def update_sections
    # updates artists and songs based on genre selected
    subj = Subject.find(params[:dept_id])
    @select_id = params[:id]
    if params[:course_num_id].empty?
      @section_options = [].insert(0, "")
    else
      course_num = params[:course_num_id]
      # map to name and id for use in our options_for_select
      @term = Term.find_by active: 1;
      @sections = Course.where(:abbreviated_subject => subj.subject_code, :course_number => course_num, :term_id => @term.id)
      @section_options = [];
      @sections.each do |c|
        @section_options.push(c.section_number)
      end
      @section_options = @section_options.uniq
      @section_options.insert(0, "")
    end
  end
  
  def create_schedule
    if params[:schedule][:name] == ""
      flash[:notice] = 'Schedule must include a name.'
      redirect_to add_schedule_path
    else
      #add courses to schedule, schedule to user
      id = session[:user_id]
      @user = User.find(id)
      @term = Term.find_by active: 1;
      @schedule = Schedule.new
      @schedule.update_attributes(:name => params[:schedule][:name])
      @user.schedules.push(@schedule)
      7.times do |n|
        subj_symb = "dept_id_#{n+1}".to_sym
        number_symb = "course_num_id_#{n+1}".to_sym
        section_symb = "section_num_id_#{n+1}".to_sym
        check_symb = "mand_#{n+1}".to_sym
        if !(params[section_symb] == "")
          subj = Subject.find(params[subj_symb]).subject_code
          @course = Course.where(:abbreviated_subject => subj, :course_number => params[number_symb], :section_number => params[section_symb], :term_id => @term.id)
          @schedule.courses.push(@course)
          if !params[check_symb].nil?
            #update mandatory attribute
            @sched_table = ScheduleToCourse.find_by course_id: @course.ids
            @sched_table.update_attributes(:mandatory => true)
          end
        end
      end
      flash[:notice] = 'Schedule added!'
      redirect_to view_terms_path
    end
  end
  
  def view_schedule
    @schedule = Schedule.find(params[:id])
    @courses = @schedule.courses
    @associations = ScheduleToCourse.where(:schedule_id => @schedule.id)
  end
  
  def schedule_params
    params.require(:schedule).permit(:name, course_ids: [])
  end
  
  def delete_schedule 
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    
    flash[:notice] = 'Schedule deleted!'
    redirect_to view_terms_path
  end
  
  def closed
    id = session[:user_id]
    @user = User.find(id)
  end
end
