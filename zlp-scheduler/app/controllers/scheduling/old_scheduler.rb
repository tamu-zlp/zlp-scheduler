class Scheduler
    def initialize(schedules)
        # @combinations = self.get_combinations(schedules)
    end

    
    def optimize
        optimal_index = [0,0]
        optimal_combo = self.schedules[optimal_index]
        optimal_val = Integer::MAX
        
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


    # uses n^m size string for indexing. also has recursive solution with backtracking
    def optimize
        optimal_index = [0, 0]
        optimal_combo = self.schedules[optimal_index]
        optimal_val = Integer::MAX

        rows = self.schedules.length
        cols = self.schedules[0].length

        total_num_combos = rows ** cols

        for i in 0...total_num_combos
            index = i.to_str
            combo = get_combinations(self.schedules, index)
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
    

    private # (change to instance methods after testing, remove self.___)

    # old method for getting all possible combinations 
    def get_combinations(schedules)
        return schedules[0]
    end

    
    # extract a single combination from the schedule using the specified index
    # index is a string 
    def get_combination(schedules, index)
        # combo = empty array??

        for i in 0...index.length
            combo += schedules[index[i].to_int][i]
        end

        return combo
    end 

    def get_conflicts(schedule, time_slot)
        # return the students who have a conflict with the optimal time-slot
        # should just be an O(n) time algorithm that checks which student has the same conflicting time
        # in their schedule as the time slots 
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



m3 = [[0,0,0,1,0],
[1,1,0,1,0],
[1,1,0,0,0],
[1,1,1,0,0],
[0,1,0,0,1],
[1,0,0,0,0],
[0,0,0,1,1]]

m4 = [[0,0,1,1,1],
[0,1,1,0,1],
[1,0,0,0,0],
[1,0,1,0,0],
[0,0,0,0,1],
[1,0,0,0,0],
[0,0,0,1,0]]

m5 = [[1,0,0,1,1],
[1,0,0,0,1],
[1,0,0,0,1],
[1,0,1,1,0],
[0,1,0,1,1],
[1,1,0,1,0],
[0,1,0,1,0]]

m = [m3, m4, m5]

s = Scheduler.new(m)
a = s.element_wise_sum(m)
min_index, min = s.sliding_window(a)


require 'matrix'
m1 = Matrix[a]
print(m1)

puts min
puts min_index