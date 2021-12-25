module Year2021
  class Day13
    def part1(input)
      rows = input.split("\n")

      points = []
      reflections = []

      rows.each do |row|
        next if row == ''

        if row.include?(',')
          points << row.split(',').map(&:to_i)
        else
          parsed = row.split('=')

          reflections << { parsed.first[-1] => parsed.last.to_i }
        end
      end

      max_x = points.map(&:first).max + 1
      max_y = points.map(&:last).max + 1

      grid = Array.new(max_y) {Array.new(max_x, false) }

      points.each do |point|
        grid[point.last][point.first] = true
      end

      first_reflection = reflections.first 
      axis = first_reflection.keys.first 
      reflect_value = first_reflection.values.first 

      count = 0
    
      if axis == 'x'
        for row in 0..(max_y-1) do
          for col in 0..(reflect_value-1) do
            begin 
            grid[row][col] = grid[row][col] || grid[row][-(col+1)]
            rescue StandardError => e
              byebug
              puts e
            end
            count += 1 if grid[row][col]
          end
        end
      else
        for row in 0..(reflect_value-1) do
          for col in 0..(max_x-1) do 
            grid[row][col] = grid[row][col] || grid[-(row+1)][col]
            count += 1 if grid[row][col]
          end
        end
      end

      count
    end

    def part2(input)
      rows = input.split("\n")

      points = []
      reflections = []

      rows.each do |row|
        next if row == ''

        if row.include?(',')
          points << row.split(',').map(&:to_i)
        else
          parsed = row.split('=')

          reflections << { parsed.first[-1] => parsed.last.to_i }
        end
      end

      max_x = points.map(&:first).max + 1
      max_y = points.map(&:last).max + 1

      grid = Array.new(max_y) {Array.new(max_x, false) }

      points.each do |point|
        grid[point.last][point.first] = true
      end

      reflections.each do |reflection| 
        axis = reflection.keys.first 
        reflect_value = reflection.values.first 

        if axis == 'x'
          for row in 0..(max_y-1) do
            for col in 0..(reflect_value-1) do
              grid[row][col] = grid[row][col] || grid[row][-(col+1)]
            end
          end

          max_x = reflect_value
        else
          for row in 0..(reflect_value-1) do
            for col in 0..(max_x-1) do 
              grid[row][col] = grid[row][col] || grid[-(row+1)][col]
            end
          end

          max_y = reflect_value
        end
      end

      code = ''

      for row in 0..(max_y-1) do 
        for col in 0..(max_x-1) do 
          if grid[row][col] 
            code += '#'
          else
            code += ' '
          end

          code += "\n" if col == max_x-1
        end
      end

      nil
    end
  end
end
