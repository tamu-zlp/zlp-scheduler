require 'matrix'

a = Matrix[[0, 1, 0], [1, 0, 1], [1, 1, 1]]
b = Matrix[[1, 1, 1], [1, 0, 0], [0, 0, 1]]
c = Matrix[[0, 1, 1], [0, 0, 1], [1, 0, 1]]

schedules = Matrix[a.to_a, b.to_a, c.to_a]
puts schedules


openTimes = Array.new(6){Array.new(5,0)}

for i in 0...row-1
    for j in 0...col
        openTimes[i][j] = sum[i][j] + sum[i + 1][j]
        if sum[i][j] + sum[i + 1][j] == 0
            puts "open window starts at #{i},#{j}"
        end
    end
end
puts openTimes

