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
        
        
@user4 = User.new
        @user4.firstname = 'Matt'
        @user4.lastname = 'Apples'
        @user4.uin = 0003
        @user4.email = 'apples@tamu.edu'
        @user4.role = 'student'
        @user4.password = "temp"
        @user4.save
        
@user5 = User.new
        @user5.firstname = 'a'
        @user5.lastname = 'aa'
        @user5.uin = 0015
        @user5.email = 'a@tamu.edu'
        @user5.role = 'student'
        @user5.password = "temp"
        @user5.save


@user6 = User.new
        @user6.firstname = 'b'
        @user6.lastname = 'ab'
        @user6.uin = 0004
        @user6.email = 'ab@tamu.edu'
        @user6.role = 'student'
        @user6.password = "temp"
        @user6.save


@user7 = User.new
        @user7.firstname = 'c'
        @user7.lastname = 'ac'
        @user7.uin = 0005
        @user7.email = 'ac@tamu.edu'
        @user7.role = 'student'
        @user7.password = "temp"
        @user7.save


@user8 = User.new
        @user8.firstname = 'd'
        @user8.lastname = 'ad'
        @user8.uin = 0006
        @user8.email = 'ad@tamu.edu'
        @user8.role = 'student'
        @user8.password = "temp"
        @user8.save


@user9 = User.new
        @user9.firstname = 'e'
        @user9.lastname = 'ae'
        @user9.uin = 0007
        @user9.email = 'ae@tamu.edu'
        @user9.role = 'student'
        @user9.password = "temp"
        @user9.save


@user10 = User.new
        @user10.firstname = 'f'
        @user10.lastname = 'af'
        @user10.uin = 0020
        @user10.email = 'af@tamu.edu'
        @user10.role = 'student'
        @user10.password = "temp"
        @user10.save


@user11 = User.new
        @user11.firstname = 'g'
        @user11.lastname = 'ag'
        @user11.uin = 0045
        @user11.email = 'ag@tamu.edu'
        @user11.role = 'student'
        @user11.password = "temp"
        @user11.save


@user12 = User.new
        @user12.firstname = 'h'
        @user12.lastname = 'ah'
        @user12.uin = 0010
        @user12.email = 'ah@tamu.edu'
        @user12.role = 'student'
        @user12.password = "temp"
        @user12.save


@user13 = User.new
        @user13.firstname = 'i'
        @user13.lastname = 'ai'
        @user13.uin = 0011
        @user13.email = 'ai@tamu.edu'
        @user13.role = 'student'
        @user13.password = "temp"
        @user13.save


@user14 = User.new
        @user14.firstname = 'j'
        @user14.lastname = 'aj'
        @user14.uin = 0012
        @user14.email = 'aj@tamu.edu'
        @user14.role = 'student'
        @user14.password = "temp"
        @user14.save


@user15 = User.new
        @user15.firstname = 'k'
        @user15.lastname = 'ak'
        @user15.uin = 0013
        @user15.email = 'ak@tamu.edu'
        @user15.role = 'student'
        @user15.password = "temp"
        @user15.save


@user16 = User.new
        @user16.firstname = 'l'
        @user16.lastname = 'al'
        @user16.uin = 0014
        @user16.email = 'al@tamu.edu'
        @user16.role = 'student'
        @user16.password = "temp"
        @user16.save

  
        
# Produce some data for testing the algorithm
Term.ImportTermList!
@term = Term.first

Subject.ImportSubjectsForTerm!(@term)
@subject = Subject.first

# could index thru courses but everyone taking 5 accounting courses is fine for testing
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
@user3.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for fourth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 9*num_courses])
end
@user4.schedules.push(@schedule)

# add second schedule for fourth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 10*num_courses])
end
@user4.schedules.push(@schedule)

# add third schedule for fourth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 11*num_courses])
end
@user4.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for fifth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 12*num_courses])
end
@user5.schedules.push(@schedule)

# add second schedule for fifth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 13*num_courses])
end
@user5.schedules.push(@schedule)

# add third schedule for fifth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 14*num_courses])
end
@user5.schedules.push(@schedule)


# ----- Get new courses for next 5 students --------------- #
@subject = Subject.all[2]

# could index thru courses but everyone taking 5 accounting courses is fine for testing
Course.ImportCourses!(@term, @subject) 
@courses = Course.all


#------------------------------------------------#
# add first schedule for sixth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + num_courses])
end
@user6.schedules.push(@schedule)

# add second schedule for sixth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 2*num_courses])
end
@user6.schedules.push(@schedule)

# add third schedule for sixth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 3*num_courses])
end
@user6.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for seventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 4*num_courses])
end
@user7.schedules.push(@schedule)

# add second schedule for seventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 5*num_courses])
end
@user7.schedules.push(@schedule)

# add third schedule for seventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 6*num_courses])
end
@user7.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for eigth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 7*num_courses])
end
@user8.schedules.push(@schedule)

# add second schedule for eigth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 8*num_courses])
end
@user8.schedules.push(@schedule)

# add third schedule for eigth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 9*num_courses])
end
@user8.schedules.push(@schedule)

#------------------------------------------------#
# add first schedule for ninth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 10*num_courses])
end
@user9.schedules.push(@schedule)

# add second schedule for ninth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 11*num_courses])
end
@user9.schedules.push(@schedule)

# add third schedule for ninth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 12*num_courses])
end
@user9.schedules.push(@schedule)


# ------ Get new subject for next 6 students ------ #
@subject = Subject.all[20]

# could index thru courses but everyone taking 5 accounting courses is fine for testing
Course.ImportCourses!(@term, @subject) 
@courses = Course.all

#------------------------------------------------#
# add first schedule for tenth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + num_courses])
end
@user10.schedules.push(@schedule)

# add second schedule for tenth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 2*num_courses])
end
@user10.schedules.push(@schedule)

# add third schedule for tenth user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 3*num_courses])
end
@user10.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for eleventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 4*num_courses])
end
@user11.schedules.push(@schedule)

# add second schedule for eleventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 5*num_courses])
end
@user11.schedules.push(@schedule)

# add third schedule for eleventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 6*num_courses])
end
@user11.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for 12th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 7*num_courses])
end
@user12.schedules.push(@schedule)

# add second schedule for eleventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 8*num_courses])
end
@user12.schedules.push(@schedule)

# add third schedule for eleventh user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 9*num_courses])
end
@user12.schedules.push(@schedule)



#------------------------------------------------#
# add first schedule for 13th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 10*num_courses])
end
@user13.schedules.push(@schedule)

# add second schedule for 13th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 11*num_courses])
end
@user13.schedules.push(@schedule)

# add third schedule for 13th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 12*num_courses])
end
@user13.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for 14th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 13*num_courses])
end
@user14.schedules.push(@schedule)

# add second schedule for 14th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 14*num_courses])
end
@user14.schedules.push(@schedule)

# add third schedule for 14th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 15*num_courses])
end
@user14.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for 15th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 16*num_courses])
end
@user15.schedules.push(@schedule)

# add second schedule for 15th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 17*num_courses])
end
@user15.schedules.push(@schedule)

# add third schedule for 15th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 18*num_courses])
end
@user15.schedules.push(@schedule)


#------------------------------------------------#
# add first schedule for 16th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 19*num_courses])
end
@user16.schedules.push(@schedule)

# add second schedule for 16th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 20*num_courses])
end
@user16.schedules.push(@schedule)

# add third schedule for 16th user
@schedule = Schedule.new
num_courses.times do |i|
        @schedule.courses.push(@courses[i + 21*num_courses])
end
@user16.schedules.push(@schedule)