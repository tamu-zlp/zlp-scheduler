
  Given('Student is created') do
    @cohort = Cohort.find_by(:name => "Admin Test Cohort")
    @user = FactoryBot.create(:user, :role=>"student", :cohort_id => @cohort.id)
  end
  
  
  Given('The schedule is added') do
      @cohort = Cohort.find_by(:name => "Admin Test Cohort")
      @schedule = Schedule.new
      @schedule.update_attributes(:name => "test schedule")
      @user.schedules.push(@schedule)
      @subject = Subject.create!(subject_code: 'CHEN',subject_description:"Test", term_id: @term.id)
      @course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 432, section_number: 904, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,5,6,'-05:00'), meeting_days: ['T']).save!()
      @thecourse = Course.where(:abbreviated_subject => 'CHEN', :course_number => 432, :section_number => 904, :term_id => @term.id)
      @schedule.courses.push(@thecourse.first)
      @schedule.save
      @user.schedules.push(@schedule)   
      @user.save
      puts @thecourse.first.id
      puts @user.cohort_id
      puts @cohort.id
      
  end
  
