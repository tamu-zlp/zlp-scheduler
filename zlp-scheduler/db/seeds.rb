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
        @user1.uin = 0001
        @user1.email = 'obama@tamu.edu'
        @user1.role = 'student'
        @user1.password = "temp"
        @user1.save
        
@user2 = User.new
        @user2.firstname = 'Mahatma'
        @user2.lastname = 'Gandhi'
        @user2.uin = 0002
        @user2.email = 'gandhi@tamu.edu'
        @user2.role = 'student'
        @user2.password = "temp"
        @user2.save
        
@user3 = User.new
        @user3.firstname = 'Johnny'
        @user3.lastname = 'Appleseed'
        @user3.uin = 0003
        @user3.email = 'apples@tamu.edu'
        @user3.role = 'student'
        @user3.password = "temp"
        @user3.save
       
        
# Produce some data for testing the algorithm
Term.ImportTermList!
@term = Term.first
@term.update_attributes(:active => 1)

Subject.ImportSubjectsForTerm!(@term)
@subject = Subject.first

# could index thru courses but everyone taking 7 accounting courses is fine for testing
Course.ImportCourses!(@term, @subject) 
@courses = Course.all

        
#--- add users to database (3 schedules, 7 unique courses per schedule) ---#
num_courses = 7

# add first schedule for first user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i])
end
@user1.schedules.push(@schedule)


# add second schedule for first user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + num_courses])
end
@user1.schedules.push(@schedule)

# add third schedule for first user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 2*num_courses])
end
@user1.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for second user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 3*num_courses])
end
@user2.schedules.push(@schedule)

# add second schedule for second user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 4*num_courses])
end
@user2.schedules.push(@schedule)

# add third schedule for second user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 5*num_courses])
end
@user2.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for third user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 6*num_courses])
end
@user3.schedules.push(@schedule)

# add second schedule for third user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 7*num_courses])
end
@user3.schedules.push(@schedule)

# add third schedule for third user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 8*num_courses])
end

