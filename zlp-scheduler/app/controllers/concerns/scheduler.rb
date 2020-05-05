# taken from https://gist.github.com/pithyless/9738125 to get "max" integer
# maybe convert this into a mixin later on??
class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
end


class Scheduler
    def initialize(schedules)
        # @schedules = get_all_schedules(User.all)
        @schedules = schedules
    end
    

    # uses n^m size N-ary string for indexing 
    def optimize
        optimal_index = [0, 0]
        optimal_combo = @schedules[0]
        # want to minimize val, therefore use largest possible int. shouldnt ever get close to this num
        optimal_val = Integer::MAX 

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
                optimal_val = val
                optimal_index = index
                optimal_combo = combo
            end
        end
        
        # return optimal_combo, optimal_index, optimal_val
        return format_output(optimal_combo, optimal_index, optimal_val)
    end

    # private
    
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