# taken from https://gist.github.com/pithyless/9738125 to get "max" integer
class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
end

class SchedulesController
    def initialize(schedules)
        # probably do something
        @schedules = schedules
    end

    # private

    # uses n^m size string for indexing. also has recursive solution with backtracking
    def optimize
        optimal_index = [0, 0]
        optimal_combo = @schedules[0]
        optimal_val = Integer::MAX

        rows = @schedules.length
        cols = @schedules[0].length

        total_num_combos = rows ** cols
        index = ""

        for i in 0...total_num_combos
            index = i.to_s(@schedules.length) # convert to base N
            combo = get_combination(@schedules, index)
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

    # extract a single combination from the schedule using the specified index
    # index is a string 
    def get_combination(schedules, index)
        combo = Array.new

        for i in 0...index.length
            combo.push(schedules[index[i].to_i][i])
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


# simple testing for the scheduling controller

m1 = [[0,0,1,1,0],
    [1,0,1,1,0],
    [1,0,1,1,0],
    [1,0,1,1,1],
    [1,1,0,1,0],
    [1,1,0,1,1],
    [0,1,1,0,1]]

m2 = [[1,0,1,1,1],
    [0,1,1,1,1],
    [1,0,0,0,1],
    [1,0,0,1,0],
    [0,1,0,1,0],
    [1,1,0,0,0],
    [0,1,0,1,0]]

m3 = [[1,0,0,1,1],
    [1,0,0,1,1],
    [1,0,0,1,1],
    [1,0,1,1,0],
    [0,0,1,0,1],
    [1,0,1,1,0],
    [0,0,0,1,0]]


m4 = [[0,0,0,1,0],
    [1,1,0,1,0],
    [1,1,0,0,0],
    [1,1,1,0,0],
    [0,1,0,0,1],
    [1,0,0,0,0],
    [0,0,0,1,1]]

m5 = [[0,0,1,1,1],
    [0,1,1,0,1],
    [1,0,0,0,0],
    [1,0,1,0,0],
    [0,0,0,0,1],
    [1,0,0,0,0],
    [0,0,0,1,0]]

m6 = [[1,1,0,1,1],
    [1,0,0,0,1],
    [1,0,0,0,1],
    [1,0,1,1,0],
    [0,1,0,1,1],
    [1,1,0,1,0],
    [0,1,0,1,0]]

m = [[m1, m2, m3], [m4, m5, m6]]


'''
scheduler = SchedulesController.new

index = "010"
x = scheduler.get_combination(m, index)
summed_matrix = scheduler.element_wise_sum(x)
min_index, min = scheduler.sliding_window(summed_matrix)


print(summed_matrix)

puts min
puts min_index

print
print
print(x)
'''

s = SchedulesController.new(m)
optimal_combo, optimal_index, optimal_val = s.optimize
print(optimal_combo)
print(optimal_index)
print(optimal_val)