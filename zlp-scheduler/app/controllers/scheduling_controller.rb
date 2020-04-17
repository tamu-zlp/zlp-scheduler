class SchedulingController < ApplicationContoller
    def initialize(schedules)
        # @combinations = self.get_combinations(schedules)
    end

    
    def optimize
        optimal_index = [0,0]
        optimal_combo = self.schedules[optimal_index]
        optimal_val = inf # how to get largest integer ?? 
        
        @combinations.each do |combo|
            sum_matrix = self.element_wise_sum(combo)
            index, val = self.sliding_window(sum_matrix)
            
            if val < optimal_val
                optimal_combo = combo
                optimal_index = index
                optimal_val = val
            end
        end
        
        return optimal_combo, optimal_index, optimal_val
    end
    

    private
    
    def get_combinations(schedules)
        # temporarily just return the first row of schedules for testing
        return schedules
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
end