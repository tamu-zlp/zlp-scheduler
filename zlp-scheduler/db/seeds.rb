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


#@terms = Term.ImportTermList!
#@term = Term.find_by active: 1

@term = Term.new
@term.name = "Test Term"
@term.id = 1
@term.opendate = DateTime.new(2001,2,3,4,5,6,'+03:00')
@term.closedate = DateTime.new(2025,2,3,4,5,6,'+03:00')
@term.active = 1
@term.save

@subject = Subject.create!(subject_code: "ISEN", subject_description:"Test", term_id: @term.id)

@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "ISEN", course_number: 210, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['M','W'])
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "ISEN", course_number: 310, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M','W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "ISEN", course_number: 330, section_number: 901, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,45,6,'-05:00'), meeting_days: ['T','TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "ISEN", course_number: 320, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,15,45,6,'-05:00'), meeting_days: ['M','W']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "ISEN", course_number: 210, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['M','W']).save

@subject = Subject.create!(subject_code: "CHEN", subject_description:"CHEN Test", term_id: @term.id)

@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 425, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,12,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,50,6,'-05:00'), meeting_days: ['M','W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 432, section_number: 900, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,14,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,17,50,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 432, section_number: 904, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,15,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,15,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 432, section_number: 902, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,50,6,'-05:00'), meeting_days: ['M']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 461, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M','W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 461, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,13,35,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,14,25,6,'-05:00'), meeting_days: ['M','W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 481, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,15,6,'-05:00'), meeting_days: ['TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 481, section_number: 502, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 481, section_number: 503, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 482, section_number: 200, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "CHEN", course_number: 482, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,11,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,12,45,6,'-05:00'), meeting_days: ['T','TR']).save

@subject = Subject.create!(subject_code: "MATH", subject_description:"MATH Test", term_id: @term.id)

@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "MATH", course_number: 151, section_number: 507, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,0,6,'-05:00'), meeting_days: ['T','TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "MATH", course_number: 152, section_number: 522, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,17,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,18,15,6,'-05:00'), meeting_days: ['T','TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "MATH", course_number: 152, section_number: 523, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,15,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,16,30,6,'-05:00'), meeting_days: ['M','TR']).save

@subject = Subject.create!(subject_code: "NUEN", subject_description:"NUEN Test", term_id: @term.id)

@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "NUEN", course_number: 301, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,00,6,'-05:00'), meeting_days: ['T','TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "NUEN", course_number: 301, section_number: 200, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,45,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,00,6,'-05:00'), meeting_days: ['M','TR']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "NUEN", course_number: 309, section_number: 200, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,10,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,40,6,'-05:00'), meeting_days: ['W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "NUEN", course_number: 309, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,10,30,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,11,15,6,'-05:00'), meeting_days: ['M','W','F']).save
@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "NUEN", course_number: 309, section_number: 501, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,9,20,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,10,10,6,'-05:00'), meeting_days: ['M','W','F']).save

@subject = Subject.create!(subject_code: "THAR", subject_description:"THAR Test", term_id: @term.id)

@course = Course.create!(subject_id: @subject.id, abbreviated_subject: "THAR", course_number: 201, section_number: 500, term_id: @term.id, meetingtime_start: DateTime.new(2001,2,3,8,0,6,'-05:00'), meetingtime_end: DateTime.new(2001,2,3,9,15,6,'-05:00'), meeting_days: ['T','TR']).save


#Subject.ImportSubjectsForTerm! @term

#@term.import_specific_courses ["ISEN","CHEN","NUEN","MATH","THAR"]

@user = User.new
        @user.firstname = 'Lauren'
        @user.lastname = 'Haylock'
        @user.uin = 725000950
        @user.email = 'laurenrhaylock@tamu.edu'
        @user.role = 'admin'
        @user.password = "Temp"
        @user.save
        
@cohort = Cohort.new
        @cohort.name = "Test Cohort"
        @cohort.term_id = 1
        @cohort.save
        
# @user = User.new
#         @user.firstname = 'Kylie'
#         @user.lastname = 'Brown'
#         @user.uin = 424242
#         @user.email = 'kyliebrown@tamu.edu'
#         @user.role = 'student'
#         @user.password = "Temp"
#         @user.cohort_id = @cohort.id
#         @user.save
       

# kylie_classes = [
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 310, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 330, :section_number => 901, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 320, :section_number => 502, :term_id => @term.id},
# ]
# create_schedule(@user,"Test 1", kylie_classes)

# # kylie_classes = [
# #         {:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 904, :term_id => @term.id},
# #         {:abbreviated_subject => "ISEN", :course_number => 310, :section_number => 501, :term_id => @term.id},
# #         {:abbreviated_subject => "MATH", :course_number => 151, :section_number => 523, :term_id => @term.id},
# #         {:abbreviated_subject => "ISEN", :course_number => 320, :section_number => 502, :term_id => @term.id},
# # ]
# kylie_classes = [
#         {:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 902, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 310, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "MATH", :course_number => 151, :section_number => 507, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 320, :section_number => 502, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id},
# ]
# create_schedule(@user,"Test 2", kylie_classes)
        

        
# @user = User.new
#         @user.firstname = 'Gabi'
#         @user.lastname = 'Hernandez'
#         @user.uin = 852648
#         @user.email = 'gabihernandez@tamu.edu'
#         @user.role = 'student'
#         @user.password = "Temp"
#         @user.cohort_id = @cohort.id
#         @user.save
        
# gabi_classes = [
#         {:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 904, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 461, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 425, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 481, :section_number => 503, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id}
# ]
# create_schedule(@user,"Test 1", gabi_classes)

# gabi_classes = [
#         {:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 904, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 461, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 481, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "MATH", :course_number => 152, :section_number => 522, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id}
# ]
# create_schedule(@user,"Test 2", gabi_classes)
        
# @user = User.new
#         @user.firstname = 'Kiersten'
#         @user.lastname = 'Potter'
#         @user.uin = 799852
#         @user.email = 'tonystark@tamu.edu'
#         @user.role = 'student'
#         @user.password = "Temp"
#         @user.cohort_id = @cohort.id
#         @user.save
        
# kiersten_classes = [
#         {:abbreviated_subject => "CHEN", :course_number => 461, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 425, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 900, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 481, :section_number => 502, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id}
# ]
# create_schedule(@user,"Test 1", kiersten_classes)

# kiersten_classes = [
#         {:abbreviated_subject => "NUEN", :course_number => 309, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 425, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 320, :section_number => 502, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id}
# ]
# create_schedule(@user,"Test 2", kiersten_classes)
        
# @user = User.new
#         @user.firstname = 'Valentina'
#         @user.lastname = 'Alarcon'
#         @user.uin = 458723
#         @user.email = 'scoobydoo@tamu.edu'
#         @user.role = 'student'
#         @user.password = "Temp"
#         @user.cohort_id = @cohort.id
#         @user.save
        
# valentina_classes = [
#         {:abbreviated_subject => "NUEN", :course_number => 309, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "MATH", :course_number => 152, :section_number => 523, :term_id => @term.id},
#         {:abbreviated_subject => "THAR", :course_number => 201, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "NUEN", :course_number => 301, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id}
# ]
# create_schedule(@user,"Test 1", valentina_classes)

# valentina_classes = [
#         {:abbreviated_subject => "NUEN", :course_number => 309, :section_number => 501, :term_id => @term.id},
#         {:abbreviated_subject => "MATH", :course_number => 152, :section_number => 522, :term_id => @term.id},
#         {:abbreviated_subject => "THAR", :course_number => 201, :section_number => 500, :term_id => @term.id},
#         {:abbreviated_subject => "NUEN", :course_number => 301, :section_number => 200, :term_id => @term.id},
#         {:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 200, :term_id => @term.id},
#         {:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 501, :term_id => @term.id}
# ]
# create_schedule(@user,"Test 2", valentina_classes)
        

#print(@terms)
#@terms.each do |t|
#        Term.create!(t)
#end 
#@term = @terms.all[0]
#@term.update_attributes(:active => 1)

@user = User.new
	@user.firstname = 'Valentina'
	@user.lastname = 'Alarcon'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
valentina_classes = [
	{:abbreviated_subject => "THAR", :course_number => 201, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "NUEN", :course_number => 309, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "NUEN", :course_number => 301, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "MATH", :course_number => 152, :section_number => 523, :term_id => @term.id,},
	{:abbreviated_subject => "ENGR", :course_number => 450, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", valentina_classes)
@user = User.new
	@user.firstname = 'Gabi'
	@user.lastname = 'Hernandez'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
gabi_classes = [
	{:abbreviated_subject => "CHEN", :course_number => 425, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 904, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 461, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 481, :section_number => 503, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 489, :section_number => 501, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", gabi_classes)
@user = User.new
	@user.firstname = 'Keerat'
	@user.lastname = 'Singh'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
keerat_classes = [
	{:abbreviated_subject => "CSCE", :course_number => 431, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "CSCE", :course_number => 421, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "MATH", :course_number => 407, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "MUSC", :course_number => 201, :section_number => 501, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", keerat_classes)
@user = User.new
	@user.firstname = 'Michael'
	@user.lastname = 'Sporkin'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
michael_classes = [
	{:abbreviated_subject => "ECEN", :course_number => 403, :section_number => 973, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 442, :section_number => 504, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 464, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 445, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", michael_classes)
@user = User.new
	@user.firstname = 'Eric'
	@user.lastname = 'Mills'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
eric_classes = [
	{:abbreviated_subject => "CSCE", :course_number => 315, :section_number => 906, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 449, :section_number => 505, :term_id => @term.id,},
	{:abbreviated_subject => "CSCE", :course_number => 313, :section_number => 514, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", eric_classes)
@user = User.new
	@user.firstname = 'Max'
	@user.lastname = 'Huffman'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
max_classes = [
	{:abbreviated_subject => "ECEN", :course_number => 442, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 464, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 403, :section_number => 974, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 489, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", max_classes)
@user = User.new
	@user.firstname = 'Bailee'
	@user.lastname = 'Allen'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
bailee_classes = [
	{:abbreviated_subject => "ENGR", :course_number => 380, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 315, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 405, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 424, :section_number => 906, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 446, :section_number => 502, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", bailee_classes)
@user = User.new
	@user.firstname = 'Astrid'
	@user.lastname = 'Doennem'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
astrid_classes = [
	{:abbreviated_subject => "MEEN", :course_number => 437, :section_number => 503, :term_id => @term.id,},
	{:abbreviated_subject => "AREN", :course_number => 401, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "MATH", :course_number => 411, :section_number => 200, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 444, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", astrid_classes)
@user = User.new
	@user.firstname = 'James'
	@user.lastname = 'Kirkland'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
james_classes = [
	{:abbreviated_subject => "ECEN", :course_number => 340, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 434, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 442, :section_number => 503, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 403, :section_number => 905, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 489, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "FINC", :course_number => 427, :section_number => 501, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", james_classes)
@user = User.new
	@user.firstname = 'Hayden'
	@user.lastname = 'Monroe'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
hayden_classes = [
	{:abbreviated_subject => "ENGR", :course_number => 380, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 401, :section_number => 506, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 404, :section_number => 902, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 464, :section_number => 502, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", hayden_classes)
@user = User.new
	@user.firstname = 'Kara'
	@user.lastname = 'Stark'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
kara_classes = [
	{:abbreviated_subject => "PETE", :course_number => 310, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "PETE", :course_number => 301, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "PETE", :course_number => 314, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "PETE", :course_number => 353, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "PETE", :course_number => 335, :section_number => 502, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", kara_classes)
@user = User.new
	@user.firstname = 'James'
	@user.lastname = 'Swanson'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
james_classes = [
	{:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 426, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 433, :section_number => 906, :term_id => @term.id,},
	{:abbreviated_subject => "ENGR", :course_number => 482, :section_number => 918, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 481, :section_number => 502, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", james_classes)
@user = User.new
	@user.firstname = 'Briana'
	@user.lastname = 'Moreno'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
briana_classes = [
	{:abbreviated_subject => "CHEN", :course_number => 425, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 432, :section_number => 901, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 461, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 481, :section_number => 504, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 482, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", briana_classes)
@user = User.new
	@user.firstname = 'Kevin'
	@user.lastname = 'Kronenberger'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
kevin_classes = [
	{:abbreviated_subject => "ECEN", :course_number => 403, :section_number => 902, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 447, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 442, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 424, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", kevin_classes)
@user = User.new
	@user.firstname = 'Kylie'
	@user.lastname = 'Brown'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
kylie_classes = [
	{:abbreviated_subject => "ISEN", :course_number => 210, :section_number => 504, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 310, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 320, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 330, :section_number => 901, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", kylie_classes)
@user = User.new
	@user.firstname = 'Collier'
	@user.lastname = 'Cordray'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
collier_classes = [
	{:abbreviated_subject => "CVEN", :course_number => 349, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 363, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "GEOL", :course_number => 320, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "ENGR", :course_number => 482, :section_number => 941, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", collier_classes)
@user = User.new
	@user.firstname = 'Peter'
	@user.lastname = 'Luong'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
peter_classes = [
	{:abbreviated_subject => "CSCE", :course_number => 420, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 420, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ECEN", :course_number => 403, :section_number => 905, :term_id => @term.id,},
	{:abbreviated_subject => "CSCE", :course_number => 431, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", peter_classes)
@user = User.new
	@user.firstname = 'Roesha'
	@user.lastname = 'Nigos'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
roesha_classes = [
	{:abbreviated_subject => "BUSN", :course_number => 432, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CSCE", :course_number => 465, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CSCE", :course_number => 431, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ENGR", :course_number => 482, :section_number => 906, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", roesha_classes)
@user = User.new
	@user.firstname = 'Meghan'
	@user.lastname = 'Valenta'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
meghan_classes = [
	{:abbreviated_subject => "CHEN", :course_number => 322, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 461, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 425, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "MGMT", :course_number => 309, :section_number => 598, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", meghan_classes)
@user = User.new
	@user.firstname = 'Austin'
	@user.lastname = 'Walters'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
austin_classes = [
	{:abbreviated_subject => "ISEN", :course_number => 340, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 350, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 355, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 370, :section_number => 501, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", austin_classes)
@user = User.new
	@user.firstname = 'Sarah'
	@user.lastname = 'Macias'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
sarah_classes = [
	{:abbreviated_subject => "CHEN", :course_number => 323, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 324, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CHEN", :course_number => 364, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CHEM", :course_number => 322, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", sarah_classes)
@user = User.new
	@user.firstname = 'Juan'
	@user.lastname = 'Cuellar'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
juan_classes = [
	{:abbreviated_subject => "ISEN", :course_number => 355, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 405, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 440, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 330, :section_number => 901, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 399, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ENGR", :course_number => 380, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", juan_classes)
@user = User.new
	@user.firstname = 'Randi'
	@user.lastname = 'Garcia'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
randi_classes = [
	{:abbreviated_subject => "ENGR", :course_number => 380, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 355, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 370, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 399, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 405, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ISEN", :course_number => 440, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", randi_classes)
@user = User.new
	@user.firstname = 'Grace'
	@user.lastname = 'Mainka'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
grace_classes = [
	{:abbreviated_subject => "AERO", :course_number => 401, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "AERO", :course_number => 423, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "AERO", :course_number => 472, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ENGR", :course_number => 482, :section_number => 934, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", grace_classes)
@user = User.new
	@user.firstname = 'Aneil'
	@user.lastname = 'Marathi'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
aneil_classes = [
	{:abbreviated_subject => "MEEN", :course_number => 401, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 404, :section_number => 907, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 421, :section_number => 502, :term_id => @term.id,},
	{:abbreviated_subject => "CSCE", :course_number => 314, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "BUSN", :course_number => 432, :section_number => 500, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", aneil_classes)
@user = User.new
	@user.firstname = 'Ruben'
	@user.lastname = 'Ramirez'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
ruben_classes = [
	{:abbreviated_subject => "CVEN", :course_number => 315, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 405, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 365, :section_number => 505, :term_id => @term.id,},
	{:abbreviated_subject => "CVEN", :course_number => 473, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "FINC", :course_number => 409, :section_number => 599, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", ruben_classes)
@user = User.new
	@user.firstname = 'Blake'
	@user.lastname = 'Williams'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
blake_classes = [
	{:abbreviated_subject => "MEEN", :course_number => 345, :section_number => 507, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 360, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 361, :section_number => 511, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 364, :section_number => 508, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 368, :section_number => 501, :term_id => @term.id,},
	{:abbreviated_subject => "MEEN", :course_number => 461, :section_number => 501, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", blake_classes)
@user = User.new
	@user.firstname = 'Haley'
	@user.lastname = 'Ripps'
	@user.uin = 123123
	@user.email = 'abc@tamu.edu'
	@user.role = 'student'
	@user.password = 'Temp'
	@user.cohort_id = @cohort.id
	@user.save
haley_classes = [
	{:abbreviated_subject => "KINE", :course_number => 199, :section_number => 390, :term_id => @term.id,},
	{:abbreviated_subject => "ESET", :course_number => 300, :section_number => 500, :term_id => @term.id,},
	{:abbreviated_subject => "ECON", :course_number => 202, :section_number => 599, :term_id => @term.id,},
	{:abbreviated_subject => "MKTG", :course_number => 409, :section_number => 598, :term_id => @term.id,},
	{:abbreviated_subject => "MMET", :course_number => 401, :section_number => 512, :term_id => @term.id,},
]
create_schedule(@user,"Test 1", haley_classes)
