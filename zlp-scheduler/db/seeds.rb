# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.new
        @user.firstname = 'Lauren'
        @user.lastname = 'Haylock'
        @user.uin = 725000950
        @user.email = 'laurenrhaylock@tamu.edu'
        @user.role = 'admin'
        @user.password = "Temp"
        @user.save
        

Term.ImportTermList!
@term = Term.first

Subject.ImportSubjectForTerms!(@term)
@subjects = Subject.all

# could index thru courses but everyone taking 5 accounting courses is fine for testing
Course.ImportCourses!(term, subjects[0]) 
@courses = Course.all


@user = User.new
        @user.firstname = 'Barack'
        @user.lastname = 'Obama'
        @user.uin = 0000
        @user.email = 'obama@tamu.edu'
        @user.role = 'student'
        @user.password = "temp"
        @user.save

@schedule = Schedule.new

num_courses = 7
num_courses.times do |i|
        @schedule.courses.push(@courses[i])
end

@user.schedules.push(schedule)

         
