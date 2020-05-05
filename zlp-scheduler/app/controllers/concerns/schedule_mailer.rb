class ScheduleMailer
    def format_output(optimal_combo, optimal_index, optimal_val)
        days = ['M', 'T', 'W', 'R', 'F']
        minutes = (optimal_index[0] * TIME_INTERVAL) % 60
        hours = START_TIME + ((optimal_index[0] * TIME_INTERVAL) - minutes) / 60
        
        day = days[optimal_index[1]]
        time = [hours, minutes]
        return day, time, optimal_val, optimal_combo
    end
end