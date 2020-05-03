# this might need to be changed to a cohort controller or put inside admin to make more sense
# so an admin could only retrieve the optimized schedule and all of the schedules as well
class SchedulesController < ApplicationController
    import Scheduler
    
    # maybe pass in a cohort as a parameter?
    def get_optimal_schedules
        schedules = self.get_schedules(User.all)
        scheduler = Scheduler.new(schedules)
        return scheduler.optimize
    end
    
    private
    
    # i think something similiar is within the admin_controller
    def get_all_schedules(users)
        schedules = []
        
        users.each do |user|
            if user.student?
                schedules.push(self.convert_to_matrix(user.schedules))
            end
        end
        
        return schedules
    end
    
    
    # placeholder (get better names for these)
    def convert_to_matrix(schedule)
        return schedule
    end
    
    # placeholder (get better names for these)
    def convert_to_schedule(matrix)
        return matrix
    end
    
end