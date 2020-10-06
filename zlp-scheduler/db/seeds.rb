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
                @course = Course.where(class_hash)
                @schedule.courses.push(@course)
        end
        
        @schedule.save
        @user.schedules.push(@schedule)   
end


@terms = Term.ImportTermList!
@term = Term.find_by active: 1
@term.opendate = DateTime.new(2001,2,3,4,5,6,'+03:00')
@term.closedate = DateTime.new(2025,2,3,4,5,6,'+03:00')
Subject.ImportSubjectsForTerm! @term
print(@term.name)

@term.import_specific_courses ["ISEN","CHEN","NUEN","MATH","THAR"]

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
        @cohort.term_id = 202031
        @cohort.save
        
@user = User.new
        @user.firstname = 'Kylie'
        @user.lastname = 'Brown'
        @user.uin = 424242
        @user.email = 'kyliebrown@tamu.edu'
        @user.role = 'student'
        @user.password = "Temp"
        @user.cohort_id = @cohort.id
        @user.save
kylie_classes = [
        {:abbreviated_subject => "ISEN", :course_number => "210", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "ISEN", :course_number => "310", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "ISEN", :course_number => "330", :section_number => "901", :term_id => @term.id},
        {:abbreviated_subject => "ISEN", :course_number => "320", :section_number => "502", :term_id => @term.id},
]
create_schedule(@user,"Test 1", kylie_classes)
kylie_classes = [
        {:abbreviated_subject => "CHEN", :course_number => "432", :section_number => "904", :term_id => @term.id},
        {:abbreviated_subject => "ISEN", :course_number => "310", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "MATH", :course_number => "151", :section_number => "523", :term_id => @term.id},
        {:abbreviated_subject => "ISEN", :course_number => "320", :section_number => "502", :term_id => @term.id},
]
create_schedule(@user,"Test 2", kylie_classes)
        

        
@user = User.new
        @user.firstname = 'Gabi'
        @user.lastname = 'Hernandez'
        @user.uin = 852648
        @user.email = 'gabihernandez@tamu.edu'
        @user.role = 'student'
        @user.password = "Temp"
        @user.cohort_id = @cohort.id
        @user.save
        
gabi_classes = [
        {:abbreviated_subject => "CHEN", :course_number => "482", :section_number => "500", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "432", :section_number => "904", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "461", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "425", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "481", :section_number => "503", :term_id => @term.id},
]
create_schedule(@user,"Test 1", gabi_classes)

gabi_classes = [
        {:abbreviated_subject => "CHEN", :course_number => "482", :section_number => "500", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "432", :section_number => "904", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "461", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "481", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "MATH", :course_number => "152", :section_number => "522", :term_id => @term.id},
]
create_schedule(@user,"Test 2", gabi_classes)
        
@user = User.new
        @user.firstname = 'Kiersten'
        @user.lastname = 'Potter'
        @user.uin = 799852
        @user.email = 'tonystark@tamu.edu'
        @user.role = 'student'
        @user.password = "Temp"
        @user.cohort_id = @cohort.id
        @user.save
        
kiersten_classes = [
        {:abbreviated_subject => "CHEN", :course_number => "461", :section_number => "500", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "425", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "432", :section_number => "900", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "481", :section_number => "502", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "482", :section_number => "500", :term_id => @term.id},
]
create_schedule(@user,"Test 1", kiersten_classes)

kiersten_classes = [
        {:abbreviated_subject => "NUEN", :course_number => "309", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "425", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "ISEN", :course_number => "320", :section_number => "502", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "482", :section_number => "500", :term_id => @term.id},
]
create_schedule(@user,"Test 2", kiersten_classes)
        
@user = User.new
        @user.firstname = 'Valentina'
        @user.lastname = 'Alarcon'
        @user.uin = 458723
        @user.email = 'scoobydoo@tamu.edu'
        @user.role = 'student'
        @user.password = "Temp"
        @user.cohort_id = @cohort.id
        @user.save
        
valentina_classes = [
        {:abbreviated_subject => "NUEN", :course_number => "309", :section_number => "500", :term_id => @term.id},
        {:abbreviated_subject => "MATH", :course_number => "152", :section_number => "523", :term_id => @term.id},
        {:abbreviated_subject => "THAR", :course_number => "201", :section_number => "500", :term_id => @term.id},
        {:abbreviated_subject => "NUEN", :course_number => "301", :section_number => "500", :term_id => @term.id},
]
create_schedule(@user,"Test 1", valentina_classes)

valentina_classes = [
        {:abbreviated_subject => "NUEN", :course_number => "309", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "MATH", :course_number => "152", :section_number => "522", :term_id => @term.id},
        {:abbreviated_subject => "THAR", :course_number => "201", :section_number => "500", :term_id => @term.id},
        {:abbreviated_subject => "NUEN", :course_number => "301", :section_number => "501", :term_id => @term.id},
        {:abbreviated_subject => "CHEN", :course_number => "482", :section_number => "500", :term_id => @term.id}
]
create_schedule(@user,"Test 1", valentina_classes)
        

       