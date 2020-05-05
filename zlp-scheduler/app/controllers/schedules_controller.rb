# this might need to be changed to a cohort controller or put inside admin to make more sense
# so an admin could only retrieve the optimized schedule and all of the schedules as well
class SchedulesController < ApplicationController
    import Scheduler
    import MatrixGenerator
    import ScheduleMailer
    
    # maybe pass in a cohort as a parameter?
    def get_optimal_schedules
        schedules = MatrixGenerator.get_all_schedules(User.all)
        scheduler = Scheduler.new(schedules)
        SchedulerMailer.send(scheduler.optimize)
        return scheduler.optimize
    end
end