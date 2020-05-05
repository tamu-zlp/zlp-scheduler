class Helpers
    START_TIME = 8
    TIME_INTERVAL = 5
    HOUR_SHIFT = 12
    
    def self.format_time(optimal_index)
        days = ['M', 'T', 'W', 'R', 'F']
        minutes = (optimal_index[0] * TIME_INTERVAL) % 60
        hours = START_TIME + ((optimal_index[0] * TIME_INTERVAL) - minutes) / 60
        
        day = days[optimal_index[1]]
        time = [hours, minutes]
        
        self.print_schedule(optimal_summed_matrix)
        
        return day, time, optimal_val, optimal_string
    end
    
    def self.print_matrix(matrix)
        width = matrix.flatten.max.to_s.size + 2
        puts matrix.map { |a| a.map { |i| i.to_s.rjust(width) }.join }
    end
end