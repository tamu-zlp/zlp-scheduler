# this might need to be changed to a cohort controller or put inside admin to make more sense
# so an admin could only retrieve the optimized controller and all of the schedules as well
class SchedulesController < ApplicationController
    import Scheduler
    
    def initialize(user)
        # not sure how to best organize this
    end
    
    def get_schedule(user)
        
    end
    
end