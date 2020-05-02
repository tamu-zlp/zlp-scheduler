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
        
@user1 = User.new
        @user1.firstname = 'Barack'
        @user1.lastname = 'Obama'
        @user1.uin = 0000
        @user1.email = 'obama@tamu.edu'
        @user1.role = 'student'
        @user1.password = "temp"
        @user1.save
        
@user2 = User.new
        @user2.firstname = 'Mahatma'
        @user2.lastname = 'Gandhi'
        @user2.uin = 0001
        @user2.email = 'gandhi@tamu.edu'
        @user2.role = 'student'
        @user2.password = "temp"
        @user2.save
        
@user3 = User.new
        @user3.firstname = 'Johnny'
        @user3.lastname = 'Appleseed'
        @user3.uin = 0002
        @user3.email = 'apples@tamu.edu'
        @user3.role = 'student'
        @user3.password = "temp"
        @user3.save
  
        
# Produce some data for testing the algorithm
Term.ImportTermList!
@term = Term.first

Subject.ImportSubjectsForTerm!(@term)
@subject = Subject.all

# could index thru courses but everyone taking 5 accounting courses is fine for testing
Course.ImportCourses!(@term, @subject[0]) 
@courses = Course.all


# add first user to database with 7 unique courses
@schedule = Schedule.new

7.times do |i|
        @schedule.courses.push(@courses[i])
end

@user1.schedules.push(@schedule)


# add second user to database with 7 unique courses 
@schedule = Schedule.new

7.times do |i|
        @schedule.courses.push(@courses[i + 7])
end

@user2.schedules.push(@schedule)

# add third user to database with 7 unique courses
@schedule = Schedule.new

7.times do |i|
        @schedule.courses.push(@courses[i + 14])
end

@user3.schedules.push(@schedule)
