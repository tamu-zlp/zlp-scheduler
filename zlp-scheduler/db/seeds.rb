# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_schedule(student,schedule_name, classes)
        @schedule = Schedule.new
        @schedule.update_attributes(:name => schedule_name)
        student.schedules.push(@schedule)
        classes.each do |class_hash|
                print(class_hash)
                @course = Course.where(:abbreviated_subject => class_hash[:abbreviated_subject], :course_number => class_hash[:course_number], :section_number => class_hash[:section_number], :term_id => class_hash[:term_id])
                #print(@course.first.full_subject)
                @schedule.courses.push(@course.first)
        end
        
        @schedule.save
        @user.schedules.push(@schedule)   
        @user.save
end


@term = Term.new
@term.name = 'Test Term'
@term.id = 1
@term.opendate = DateTime.new(2001,2,3,4,5,6,'+03:00')
@term.closedate = DateTime.new(2025,2,3,4,5,6,'+03:00')
@term.active = 1
@term.save()

@cohort = Cohort.new
@cohort.name = 'Test Cohort'
@cohort.term_id = 1
@cohort.save()

@user = User.new 
	@user.firstname = 'Lauren'
	@user.lastname = 'Haylock'
	@user.uin = 12345
	@user.email = 'laurenrhaylock@tamu.edu'
	@user.role = 'admin'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save

@subject = Subject.create!(subject_code: 'CHEN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 432, section_number: 904, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,5,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 461, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 425, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,50,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 482, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 323, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 461, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 432, section_number: 901, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,55,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,20,45,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 481, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 324, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 364, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 433, section_number: 904, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,10,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 425, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,16,30,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 481, section_number: 503, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 489, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 322, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 481, section_number: 504, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,18,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,20,0,6,'-05:00'), meeting_days: ['Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEN',course_number: 426, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'PETE',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'PETE',course_number: 314, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,40,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,30,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'PETE',course_number: 301, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'PETE',course_number: 353, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'PETE',course_number: 335, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,25,6,'-05:00'), meeting_days: ['W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'PETE',course_number: 310, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['Th']).save



@subject = Subject.create!(subject_code: 'ECEN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 442, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,55,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,45,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 442, section_number: 504, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,10,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,0,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 489, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 445, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,8,50,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 420, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 447, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 340, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 442, section_number: 503, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 403, section_number: 902, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 424, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,13,0,6,'-05:00'), meeting_days: ['F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 464, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,40,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,30,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 434, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,16,30,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 449, section_number: 505, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,10,6,'-05:00'), meeting_days: ['F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 403, section_number: 905, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 489, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 403, section_number: 974, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECEN',course_number: 403, section_number: 973, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,50,6,'-05:00'), meeting_days: ['M', 'W']).save



@subject = Subject.create!(subject_code: 'MEEN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 401, section_number: 506, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 345, section_number: 507, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,17,10,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 404, section_number: 907, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,55,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,45,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 464, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,17,10,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 401, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 404, section_number: 902, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,55,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,45,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 461, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 360, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 421, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,8,50,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 437, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,40,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,30,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 368, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,8,50,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 364, section_number: 508, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,50,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MEEN',course_number: 361, section_number: 511, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['T']).save



@subject = Subject.create!(subject_code: 'ISEN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 399, section_number: 500, term_id: @term.id).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 330, section_number: 901, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 440, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,18,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,20,0,6,'-05:00'), meeting_days: ['F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 310, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 405, section_number: 500, term_id: @term.id).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 370, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,13,15,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 340, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 355, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,35,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 350, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 210, section_number: 504, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ISEN',course_number: 320, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,35,6,'-05:00'), meeting_days: ['M', 'W']).save



@subject = Subject.create!(subject_code: 'FINC',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'FINC',course_number: 427, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,18,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,22,15,6,'-05:00'), meeting_days: ['Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'FINC',course_number: 409, section_number: 599, term_id: @term.id).save



@subject = Subject.create!(subject_code: 'CVEN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 405, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,16,30,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 424, section_number: 906, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,40,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,40,6,'-05:00'), meeting_days: ['W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 315, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 473, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 444, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 363, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,55,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,45,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 349, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,40,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,30,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 446, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 315, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,50,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CVEN',course_number: 365, section_number: 505, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,8,50,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'CSCE',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 421, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,19,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,20,35,6,'-05:00'), meeting_days: ['M', 'W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 431, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,35,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 314, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,16,30,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 420, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,50,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 431, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 465, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 313, section_number: 514, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 315, section_number: 906, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CSCE',course_number: 431, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,8,50,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'MKTG',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MKTG',course_number: 409, section_number: 598, term_id: @term.id).save



@subject = Subject.create!(subject_code: 'MATH',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MATH',course_number: 152, section_number: 523, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,55,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,45,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MATH',course_number: 407, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,15,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MATH',course_number: 411, section_number: 200, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'ENGR',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ENGR',course_number: 450, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,0,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ENGR',course_number: 482, section_number: 941, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,50,6,'-05:00'), meeting_days: ['F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ENGR',course_number: 482, section_number: 934, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,40,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,30,6,'-05:00'), meeting_days: ['F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ENGR',course_number: 380, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ENGR',course_number: 482, section_number: 918, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ENGR',course_number: 482, section_number: 906, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['Th']).save



@subject = Subject.create!(subject_code: 'AREN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'AREN',course_number: 401, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'KINE',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'KINE',course_number: 199, section_number: 390, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'KINE',course_number: 199, section_number: 95, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,6,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,7,35,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'GEOL',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'GEOL',course_number: 320, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'MUSC',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MUSC',course_number: 201, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save



@subject = Subject.create!(subject_code: 'ESET',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ESET',course_number: 300, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,50,6,'-05:00'), meeting_days: ['M']).save



@subject = Subject.create!(subject_code: 'NUEN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'NUEN',course_number: 309, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'NUEN',course_number: 301, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'MGMT',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MGMT',course_number: 309, section_number: 598, term_id: @term.id).save



@subject = Subject.create!(subject_code: 'AERO',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'AERO',course_number: 423, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,18,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,20,0,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'AERO',course_number: 472, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T', 'Th']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'AERO',course_number: 401, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,50,6,'-05:00'), meeting_days: ['M', 'W']).save



@subject = Subject.create!(subject_code: 'ECON',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'ECON',course_number: 202, section_number: 599, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,20,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,23,30,6,'-05:00'), meeting_days: ['Th']).save



@subject = Subject.create!(subject_code: 'MMET',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'MMET',course_number: 401, section_number: 512, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,13,50,6,'-05:00'), meeting_days: ['W']).save



@subject = Subject.create!(subject_code: 'BUSN',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'BUSN',course_number: 432, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,50,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'BUSN',course_number: 432, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save



@subject = Subject.create!(subject_code: 'THAR',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'THAR',course_number: 201, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['T', 'Th']).save



@subject = Subject.create!(subject_code: 'CHEM',subject_description:"Test", term_id: @term.id)
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: 'CHEM',course_number: 322, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M', 'W', 'F']).save



@user = User.new 
	@user.firstname = 'Valentina'
	@user.lastname = 'Alarcon'
	@user.uin = 12345
	@user.email = 'Valentina_Alarcon@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




valentina_Alarcon_classes = [ 
{:abbreviated_subject => 'NUEN', :course_number => 309, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'NUEN', :course_number => 301, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 450, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'THAR', :course_number => 201, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'MATH', :course_number => 152, :section_number => 523, :term_id => @term.id },

]
create_schedule(@user,'Test 1', valentina_Alarcon_classes)



@user = User.new 
	@user.firstname = 'Gabi'
	@user.lastname = 'Hernandez'
	@user.uin = 12345
	@user.email = 'Gabi_Hernandez@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




gabi_Hernandez_classes = [ 
{:abbreviated_subject => 'CHEN', :course_number => 482, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 432, :section_number => 904, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 461, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 425, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 481, :section_number => 503, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 489, :section_number => 501, :term_id => @term.id },

]
create_schedule(@user,'Test 1', gabi_Hernandez_classes)



@user = User.new 
	@user.firstname = 'Keerat'
	@user.lastname = 'Singh'
	@user.uin = 12345
	@user.email = 'Keerat_Singh@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




keerat_Singh_classes = [ 
{:abbreviated_subject => 'CSCE', :course_number => 421, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'MATH', :course_number => 407, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'MUSC', :course_number => 201, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CSCE', :course_number => 431, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', keerat_Singh_classes)



@user = User.new 
	@user.firstname = 'Michael'
	@user.lastname = 'Sporkin'
	@user.uin = 12345
	@user.email = 'Michael_Sporkin@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




michael_Sporkin_classes = [ 
{:abbreviated_subject => 'ECEN', :course_number => 464, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 445, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 442, :section_number => 504, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 403, :section_number => 973, :term_id => @term.id },

]
create_schedule(@user,'Test 1', michael_Sporkin_classes)



@user = User.new 
	@user.firstname = 'Eric'
	@user.lastname = 'Mills'
	@user.uin = 12345
	@user.email = 'Eric_Mills@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




eric_Mills_classes = [ 
{:abbreviated_subject => 'CSCE', :course_number => 315, :section_number => 906, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 449, :section_number => 505, :term_id => @term.id },
{:abbreviated_subject => 'CSCE', :course_number => 313, :section_number => 514, :term_id => @term.id },

]
create_schedule(@user,'Test 1', eric_Mills_classes)



@user = User.new 
	@user.firstname = 'Max'
	@user.lastname = 'Huffman'
	@user.uin = 12345
	@user.email = 'Max_Huffman@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




max_Huffman_classes = [ 
{:abbreviated_subject => 'ECEN', :course_number => 489, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 464, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 442, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 403, :section_number => 974, :term_id => @term.id },

]
create_schedule(@user,'Test 1', max_Huffman_classes)



@user = User.new 
	@user.firstname = 'Bailee'
	@user.lastname = 'Allen'
	@user.uin = 12345
	@user.email = 'Bailee_Allen@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




bailee_Allen_classes = [ 
{:abbreviated_subject => 'CVEN', :course_number => 405, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 424, :section_number => 906, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 380, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 446, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 315, :section_number => 500, :term_id => @term.id },

]
create_schedule(@user,'Test 1', bailee_Allen_classes)



@user = User.new 
	@user.firstname = 'Astrid'
	@user.lastname = 'Doennem'
	@user.uin = 12345
	@user.email = 'Astrid_Doennem@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




astrid_Doennem_classes = [ 
{:abbreviated_subject => 'CVEN', :course_number => 444, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'MATH', :course_number => 411, :section_number => 200, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 437, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'AREN', :course_number => 401, :section_number => 500, :term_id => @term.id },

]
create_schedule(@user,'Test 1', astrid_Doennem_classes)



@user = User.new 
	@user.firstname = 'James'
	@user.lastname = 'Kirkland'
	@user.uin = 12345
	@user.email = 'James_Kirkland@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




james_Kirkland_classes = [ 
{:abbreviated_subject => 'FINC', :course_number => 427, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 442, :section_number => 503, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 340, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 434, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 403, :section_number => 905, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 489, :section_number => 501, :term_id => @term.id },

]
create_schedule(@user,'Test 1', james_Kirkland_classes)



@user = User.new 
	@user.firstname = 'Hayden'
	@user.lastname = 'Monroe'
	@user.uin = 12345
	@user.email = 'Hayden_Monroe@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




hayden_Monroe_classes = [ 
{:abbreviated_subject => 'MEEN', :course_number => 464, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 401, :section_number => 506, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 404, :section_number => 902, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 380, :section_number => 500, :term_id => @term.id },

]
create_schedule(@user,'Test 1', hayden_Monroe_classes)



@user = User.new 
	@user.firstname = 'Kara'
	@user.lastname = 'Stark'
	@user.uin = 12345
	@user.email = 'Kara_Stark@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




kara_Stark_classes = [ 
{:abbreviated_subject => 'PETE', :course_number => 314, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'PETE', :course_number => 301, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'PETE', :course_number => 353, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'PETE', :course_number => 335, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'PETE', :course_number => 310, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', kara_Stark_classes)



@user = User.new 
	@user.firstname = 'James'
	@user.lastname = 'Swanson'
	@user.uin = 12345
	@user.email = 'James_Swanson@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




james_Swanson_classes = [ 
{:abbreviated_subject => 'CHEN', :course_number => 482, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 481, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 482, :section_number => 918, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 433, :section_number => 904, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 426, :section_number => 500, :term_id => @term.id },

]
create_schedule(@user,'Test 1', james_Swanson_classes)



@user = User.new 
	@user.firstname = 'Briana'
	@user.lastname = 'Moreno'
	@user.uin = 12345
	@user.email = 'Briana_Moreno@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




briana_Moreno_classes = [ 
{:abbreviated_subject => 'CHEN', :course_number => 482, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 425, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 461, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 432, :section_number => 901, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 481, :section_number => 504, :term_id => @term.id },

]
create_schedule(@user,'Test 1', briana_Moreno_classes)



@user = User.new 
	@user.firstname = 'Kevin'
	@user.lastname = 'Kronenberger'
	@user.uin = 12345
	@user.email = 'Kevin_Kronenberger@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




kevin_Kronenberger_classes = [ 
{:abbreviated_subject => 'ECEN', :course_number => 403, :section_number => 902, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 424, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 442, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 447, :section_number => 500, :term_id => @term.id },

]
create_schedule(@user,'Test 1', kevin_Kronenberger_classes)



@user = User.new 
	@user.firstname = 'Kylie'
	@user.lastname = 'Brown'
	@user.uin = 12345
	@user.email = 'Kylie_Brown@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




kylie_Brown_classes = [ 
{:abbreviated_subject => 'ISEN', :course_number => 310, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 330, :section_number => 901, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 210, :section_number => 504, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 320, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', kylie_Brown_classes)



@user = User.new 
	@user.firstname = 'Collier'
	@user.lastname = 'Cordray'
	@user.uin = 12345
	@user.email = 'Collier_Cordray@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




collier_Cordray_classes = [ 
{:abbreviated_subject => 'CVEN', :course_number => 349, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'GEOL', :course_number => 320, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 482, :section_number => 941, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 363, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', collier_Cordray_classes)



@user = User.new 
	@user.firstname = 'Peter'
	@user.lastname = 'Luong'
	@user.uin = 12345
	@user.email = 'Peter_Luong@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




peter_Luong_classes = [ 
{:abbreviated_subject => 'ECEN', :course_number => 420, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CSCE', :course_number => 431, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CSCE', :course_number => 420, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ECEN', :course_number => 403, :section_number => 905, :term_id => @term.id },

]
create_schedule(@user,'Test 1', peter_Luong_classes)



@user = User.new 
	@user.firstname = 'Roesha'
	@user.lastname = 'Nigos'
	@user.uin = 12345
	@user.email = 'Roesha_Nigos@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




roesha_Nigos_classes = [ 
{:abbreviated_subject => 'CSCE', :course_number => 431, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CSCE', :course_number => 465, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'BUSN', :course_number => 432, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 482, :section_number => 906, :term_id => @term.id },

]
create_schedule(@user,'Test 1', roesha_Nigos_classes)



@user = User.new 
	@user.firstname = 'Meghan'
	@user.lastname = 'Valenta'
	@user.uin = 12345
	@user.email = 'Meghan_Valenta@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




meghan_Valenta_classes = [ 
{:abbreviated_subject => 'MGMT', :course_number => 309, :section_number => 598, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 322, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 461, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 425, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', meghan_Valenta_classes)



@user = User.new 
	@user.firstname = 'Austin'
	@user.lastname = 'Walters'
	@user.uin = 12345
	@user.email = 'Austin_Walters@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




austin_Walters_classes = [ 
{:abbreviated_subject => 'ISEN', :course_number => 355, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 350, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 370, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 340, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', austin_Walters_classes)



@user = User.new 
	@user.firstname = 'Sarah'
	@user.lastname = 'Macias'
	@user.uin = 12345
	@user.email = 'Sarah_Macias@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




sarah_Macias_classes = [ 
{:abbreviated_subject => 'CHEM', :course_number => 322, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 324, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 364, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CHEN', :course_number => 323, :section_number => 500, :term_id => @term.id },

]
create_schedule(@user,'Test 1', sarah_Macias_classes)



@user = User.new 
	@user.firstname = 'Juan'
	@user.lastname = 'Cuellar'
	@user.uin = 12345
	@user.email = 'Juan_Cuellar@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




juan_Cuellar_classes = [ 
{:abbreviated_subject => 'ISEN', :course_number => 399, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 440, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 405, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 380, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 355, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 330, :section_number => 901, :term_id => @term.id },

]
create_schedule(@user,'Test 1', juan_Cuellar_classes)



@user = User.new 
	@user.firstname = 'Randi'
	@user.lastname = 'Garcia'
	@user.uin = 12345
	@user.email = 'Randi_Garcia@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




randi_Garcia_classes = [ 
{:abbreviated_subject => 'ISEN', :course_number => 399, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 440, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 405, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 370, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 380, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ISEN', :course_number => 355, :section_number => 501, :term_id => @term.id },

]
create_schedule(@user,'Test 1', randi_Garcia_classes)



@user = User.new 
	@user.firstname = 'Grace'
	@user.lastname = 'Mainka'
	@user.uin = 12345
	@user.email = 'Grace_Mainka@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




grace_Mainka_classes = [ 
{:abbreviated_subject => 'AERO', :course_number => 423, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'AERO', :course_number => 472, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'AERO', :course_number => 401, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'ENGR', :course_number => 482, :section_number => 934, :term_id => @term.id },

]
create_schedule(@user,'Test 1', grace_Mainka_classes)



@user = User.new 
	@user.firstname = 'Aneil'
	@user.lastname = 'Marathi'
	@user.uin = 12345
	@user.email = 'Aneil_Marathi@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




aneil_Marathi_classes = [ 
{:abbreviated_subject => 'MEEN', :course_number => 404, :section_number => 907, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 401, :section_number => 502, :term_id => @term.id },
{:abbreviated_subject => 'BUSN', :course_number => 432, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CSCE', :course_number => 314, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 421, :section_number => 502, :term_id => @term.id },

]
create_schedule(@user,'Test 1', aneil_Marathi_classes)



@user = User.new 
	@user.firstname = 'Ruben'
	@user.lastname = 'Ramirez'
	@user.uin = 12345
	@user.email = 'Ruben_Ramirez@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




ruben_Ramirez_classes = [ 
{:abbreviated_subject => 'CVEN', :course_number => 405, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 315, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 473, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'FINC', :course_number => 409, :section_number => 599, :term_id => @term.id },
{:abbreviated_subject => 'CVEN', :course_number => 365, :section_number => 505, :term_id => @term.id },

]
create_schedule(@user,'Test 1', ruben_Ramirez_classes)



@user = User.new 
	@user.firstname = 'Blake'
	@user.lastname = 'Williams'
	@user.uin = 12345
	@user.email = 'Blake_Williams@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




blake_Williams_classes = [ 
{:abbreviated_subject => 'MEEN', :course_number => 345, :section_number => 507, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 461, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 360, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 368, :section_number => 501, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 364, :section_number => 508, :term_id => @term.id },
{:abbreviated_subject => 'MEEN', :course_number => 361, :section_number => 511, :term_id => @term.id },

]
create_schedule(@user,'Test 1', blake_Williams_classes)



@user = User.new 
	@user.firstname = 'Haley'
	@user.lastname = 'Ripps'
	@user.uin = 12345
	@user.email = 'Haley_Ripps@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save




haley_Ripps_classes = [ 
{:abbreviated_subject => 'MKTG', :course_number => 409, :section_number => 598, :term_id => @term.id },
{:abbreviated_subject => 'MMET', :course_number => 401, :section_number => 512, :term_id => @term.id },
{:abbreviated_subject => 'KINE', :course_number => 199, :section_number => 95, :term_id => @term.id },
{:abbreviated_subject => 'KINE', :course_number => 199, :section_number => 390, :term_id => @term.id },
{:abbreviated_subject => 'ESET', :course_number => 300, :section_number => 500, :term_id => @term.id },
{:abbreviated_subject => 'ECON', :course_number => 202, :section_number => 599, :term_id => @term.id },

]
create_schedule(@user,'Test 1', haley_Ripps_classes)




        

#print(@terms)
#@terms.each do |t|
#        Term.create!(t)
#end 
#@term = @terms.all[0]
#@term.update_attributes(:active => 1)

