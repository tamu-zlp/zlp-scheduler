class MatrixGenerator
    
    def initialize
        
    end
        
    
    # gets all schedules in matrix format for a set of users
    def get_all_schedules(users)
        all_schedules = []
        
        # only these users work for now, rest give other errors
        all_schedules.push(all_student_schedules(User.all[2].schedules))
        all_schedules.push(all_student_schedules(User.all[6].schedules))
        all_schedules.push(all_student_schedules(User.all[10].schedules))
        
        
        '''
        users.each do |user|
            if user.student?
                puts user.uin, user.schedules
                # all_schedules.push(all_student_schedules(user.schedules))
            end
        end
        '''
        
        return all_schedules
    end
    
    
    # converts all schedules for one student into matrix format
    def all_student_schedules(schedules)
        schedules = User.all[2].schedules
        user_schedule_list = []
        
        schedules.each do |schedule|
            user_schedule_list.push(student_schedule(schedule.courses))
        end
        
        return user_schedule_list # matrix of schedules for a single user: [S, S, S]
    end
    
    
    # takes as input a list of courses for a student and outputs the schedule in matrix format
    def student_schedule(courses)
        # courses = User.all[7].schedules[0].courses
        num_days = 5
        num_time_slots = 111 # 8:00am - 5:15pm in 5 minute intervals
        schedule = Array.new(num_time_slots) { Array.new(num_days, 0)} # important !!!!!
    
        # run for loop for all courses here
        courses.each do |course|
            days = parse_day(course.meeting_days)
            start_time = parse_time(course.meetingtime_start)
            end_time = parse_time(course.meetingtime_end)
            schedule = insert_course(schedule, days, start_time, end_time)
        end
        
        return schedule
    end
    
    
       
    # takes DateTime object and returns index corresponding to the time in the schedule
    def parse_time(time)
        zone = ActiveSupport::TimeZone.new("Central Time (US & Canada)")
        time = time.in_time_zone(zone)
        hour = (time.hour - 8) * 12
        minute = time.min / 5
        return hour + minute # this is the index
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
                schedule[time][day] = 1
            end
        end
        
        return schedule
    end
    
    def format_output(optimal_combo, optimal_index, optimal_val)
        days = ['M', 'T', 'W', 'R', 'F']
        minutes = (optimal_index[0] * 5) % 60
        hours = 8 + ((optimal_index[0] * 5) - minutes) / 60
        
        day = days[optimal_index[1]]
        time = [hours, minutes]
        return day, time, optimal_val, optimal_combo
    end
end