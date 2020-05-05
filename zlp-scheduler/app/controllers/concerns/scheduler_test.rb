# need to put this into test folder later on. going to have to move each section
# into own test class

class SchedulerTest
    def initialize
        @generator = MatrixGenerator.new
    end
    
    # Scheduler Tests
    
    def all_tests
        schedules = @generator.get_all_schedules(User.all)
        s = Scheduler.new(schedules)
        s.optimize
        return s
    end
    
    
    def get_combination
    end 
    
    
    def element_wise_sum
    end 
    
    
    def sliding_window
    end
    
    
    # Matrix Generator Tests
    
    def get_all_schedules
        users = User.all
        @generator.get_all_schedules(users)
    end
    
    
    def get_student_schedules(user_index)
        schedules = User.all[user_index].schedules
        @generator.get_student_schedules(schedules)
    end
    
    # only accepts user > right now
    def generate_schedule(student_index, schedule_index)
        user = User.all[student_index]
        if user.student?
            courses = user.schedules[0].courses
            @generator.generate_schedule(courses)
        else
            puts "Please use valid student index. Index %i contains an Admin" % [student_index]
        end
    end
    
    
    def parse_time
    end
    
    
    def parse_day
    end
    
    
    def insert_course
    end
    
    # Helper Tests
end