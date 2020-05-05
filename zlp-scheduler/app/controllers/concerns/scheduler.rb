# taken from https://gist.github.com/pithyless/9738125 to get "max" integer
# maybe convert this into a mixin later on??
class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
end

'''
Class: Scheduler
Takes as input a set of schedules for all students (change this to a cohort maybe?)

'''
class Scheduler
    def initialize
        # users = User.all
        # @schedules = get_all_schedules(users)
    end
    
    '''
    # gets all schedules in matrix format for a set of users
    def get_all_schedules #(users)
        users = User.all
        all_schedules = []
        
        users.each do |user|
            if user.student?
                all_schedules.push(get_user_schedules(user.schedules))
            end
        end
        
        return all_schedules
    end
    '''
    
    
    # converts all schedules for a specific student into matrix format
    def get_user_schedules(schedules)
        # schedules = User.all[2].schedules
        user_schedule_list = []
        
        schedules.each do |schedule|
            user_schedule_list.push(generate_student_schedule(schedule.courses))
        end
        
        return user_schedule_list # matrix of schedules for a single user: [S, S, S]
    end
    
    
    # takes as input a list of courses for a student and outputs the schedule in matrix format
    def generate_student_schedule(courses)
        # courses = User.all[1].schedules[0].courses
        num_days = 5
        num_time_slots = 111
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
    
    
    

    # uses n^m size N-ary string for indexing 
    def optimize
        optimal_index = [0, 0]
        optimal_combo = @schedules[0]
        # want to minimize val, therefore use largest possible int. shouldnt ever get close to this num
        optimal_val = Integer::MAX 

        rows = @schedules.length
        cols = @schedules[0].length

        total_num_combos = rows ** cols
        index = ""

        for i in 0...total_num_combos
            # convert to base N (where N is schedules.length / number of schedules)
            index = i.to_s(@schedules.length)
            combo = get_combination(@schedules, index)
            sum_matrix = self.element_wise_sum(combo)
            index, val = self.sliding_window(sum_matrix)
            
            if val < optimal_val
                optimal_val = val
                optimal_index = index
                optimal_combo = combo
            end
        end
    end

    private
    
    # extract a single combination from the schedule using the specified index
    # index is a string 
    def get_combination(schedules, index)
        combo = Array.new

        for i in 0...index.length
            combo.push(schedules[index[i].to_i][i])
        end

        return combo
    end 

    # input is an array of schedules
    def element_wise_sum(input)
        # sum array holds the summations of all schedules. size of one of the schedules (filled with zeroes)
        sum = Array.new(input[0].length) { Array.new(input[0][0].length, 0) }
        
        # add each schedule to the sum array
        input.each do |schedule|
            num_rows = schedule.length
            num_cols = schedule[0].length
        
            for i in 0...num_rows
                for j in 0...num_cols
                    sum[i][j] += schedule[i][j]
                end
            end
        end
    
        return sum
    end
    

    def sliding_window(input)
        num_rows = input.length
        num_cols = input[0].length

        # need to update this to get max value (something life inf)
        min = 10000
        # window size will be min_index + window_size
        min_index = [0, 0]
        window_size = 1
        
        for i in 0...num_rows-1
            for j in 0...num_cols
                sum = input[i][j] + input[i + window_size][j]
                if sum < min
                    min = sum
                    min_index = [i, j]
                end   
            end
        end

        return min_index, min
    end
    
    
    
    # takes DateTime object and returns index corresponding to the time in the schedule
    def parse_time(time)
        # puts time
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
end