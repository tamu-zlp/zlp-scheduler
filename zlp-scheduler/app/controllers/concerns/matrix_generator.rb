class MatrixGenerator
    def initialize
    end
    
    # gets all schedules in matrix format for a set of users
    def get_all_schedules #(users)
        users = User.all
        all_schedules = []
        
        # this code is fine but some of the users in db give back errors
        users.each do |user|
            if user.student?
                # puts user.uin, user.schedules
                all_schedules.push(get_student_schedules(user.schedules))
            end
        end
        
        return all_schedules
    end
    
    
    # converts all schedules for one student into matrix format
    def get_student_schedules(schedules)
        # schedules = User.all[2].schedules
        user_schedule_list = []
        
        schedules.each do |schedule|
            user_schedule_list.push(generate_schedule(schedule.courses))
        end
        
        return user_schedule_list # matrix of schedules for a single user: [S, S, S]
    end
    
    
    # takes as input a list of courses for a student and outputs the schedule in matrix format
    def generate_schedule(courses)
        # courses = User.all[7].schedules[0].courses
        num_days = 5
        num_time_slots = 111 # num of 5 minute intervals from 8:00am - 5:15pm
        schedule = Array.new(num_time_slots) { Array.new(num_days, 0)} # important !!!!!
    
        courses.each do |course|
            
            # puts "start time for %s" % course.course_name
            if course.meetingtime_start.nil? or course.meetingtime_end.nil?
                next
            end
            start_time = parse_time(course.meetingtime_start)
            
            # puts "end time for %s " % course.course_name
            end_time = parse_time(course.meetingtime_end)
            days = parse_day(course.meeting_days)
            schedule = insert_course(schedule, days, start_time, end_time)
        end
        
        return schedule
    end
    
    # might need to move these
    START_TIME = 8
    TIME_INTERVAL = 5
    
       
    # takes DateTime object and returns index corresponding to the time in the schedule
    def parse_time(time)
        zone = ActiveSupport::TimeZone.new("Central Time (US & Canada)")
        time = time.in_time_zone(zone)
        hour = (time.hour - START_TIME) * 12
        minute = time.min / TIME_INTERVAL
        return hour + minute # this is the index used in the schedule
    end
    
    
    
    def parse_day(days)
        day_indices = Array.new
        
        days.each do |day|
            if day == 'M'
                day_indices.push(0)
            elsif day == 'T'
                day_indices.push(1)
            elsif day == 'W'
                day_indices.push(2)
            elsif day == 'TR'
                day_indices.push(3)
            elsif day == 'F'
                day_indices.push(4)
            else 
                day_indices.push(0) # not sure what to make the default case
            end
        end
        
        return day_indices
    end

    
    # insert a single course into a schedule
    def insert_course(schedule, days, start_time, end_time)
        
        days.each do |day|
            for time in start_time...end_time
                if time < schedule[day].length
                    schedule[time][day] = 1
                end
            end
        end
        
        return schedule
    end
end