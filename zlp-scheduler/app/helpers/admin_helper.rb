module AdminHelper
    def algorithm 
        @cohort = Cohort.find(params[:cohort_id])
        Scheduler_2.Generate_time_slots(@cohort)
    end
end
