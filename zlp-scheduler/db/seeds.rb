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
        @user1.firstname = 'Brittany'
        @user1.lastname = 'Nelson'
        @user1.uin = 87690475
        @user1.email = 'Nelson@tamu.edu'
        @user1.role = 'student'
        @user1.password = "temp"
        @user1.save
        
@user2 = User.new
        @user2.firstname = 'Luke'
        @user2.lastname = 'Gore'
        @user2.uin = 394769472
        @user2.email = 'gore@tamu.edu'
        @user2.role = 'student'
        @user2.password = "temp"
        @user2.save
        
@user3 = User.new
        @user3.firstname = 'Nick'
        @user3.lastname = 'Barrio'
        @user3.uin = 485629470
        @user3.email = 'barrio@tamu.edu'
        @user3.role = 'student'
        @user3.password = "temp"
        @user3.save
        
@user4 = User.new
        @user4.firstname = 'Alli'
        @user4.lastname = 'M'
        @user4.uin = 403828492
        @user4.email = 'alli@tamu.edu'
        @user4.role = 'student'
        @user4.password = "temp"
        @user4.save
        
@user5 = User.new
        @user5.firstname = 'Mo'
        @user5.lastname = 'Ad'
        @user5.uin = 574839295
        @user5.email = 'mo@tamu.edu'
        @user5.role = 'student'
        @user5.password = "temp"
        @user5.save
       
        
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

