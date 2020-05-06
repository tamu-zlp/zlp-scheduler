# taken from https://gist.github.com/pithyless/9738125 to get "max" integer
# maybe convert this into a mixin later on??
class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
end


class Scheduler
    
    # keeping attr_reader so the outputs can be easily used on the frontend
    attr_reader :schedules
    attr_reader :optimal_index
    attr_reader :optimal_combo
    attr_reader :optimal_val
    attr_reader :optimal_summed_matrix
    
  '''  
    def get_all_schedules
        return Helpers.print_matrix(@schedules)
    end
    
    # not sure how this one should be displayed to the user
    def get_optimal_index
        return Helpers.format_time(@optimal_index)
    end
    
    def get_optimal_combo
        return Helpers.print_matrix(@optimal_combo)
    end
    
    def get_optimal_summed_matrix
        return Helpers.print_matrix(@optimal_summed_matrix)
    end
    '''
    
    
    def initialize(schedules)
        @schedules = schedules
        # return nil
    end
    

    # uses n^m size N-ary string for indexing 
    def optimize
        @optimal_index = [0, 0]
        @optimal_combo = @schedules[0]
        # want to minimize val, therefore use largest possible int. shouldnt ever get close to this num
        @optimal_val = Integer::MAX 
        @optimal_summed_matrix = []

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
                @optimal_val = val
                @optimal_index = index
                @optimal_combo = combo
                @optimal_summed_matrix = sum_matrix
            end
        end
        
        return nil
    end

    
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
            if schedule.nil?
                next
            end 
            
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
    
    HOUR_SHIFT = 12

    # finds the smallest amount (min) of conflict within a 2 hour window
    def sliding_window(summed_schedule)
        num_time_slots = summed_schedule.length
        num_days = summed_schedule[0].length

        min = Integer::MAX
        # min_index is the starting time for the window
        min_index = [0, 0]
        window_size = 2 * HOUR_SHIFT # 24 time intervals
        
        # window_size - 1 so we don't get out of bounds
        for day in 0...num_days
            for time in 0...num_time_slots - (window_size - 1)
            
                sum = 0
                for t in time...(time + window_size)
                    sum += summed_schedule[t][day]
                end
                
                if sum < min
                    min = sum
                    min_index = [time, day]
                end   
            end
        end

        return min_index, min
    end
end