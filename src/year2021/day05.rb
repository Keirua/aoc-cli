module Year2021
  class Day05
    def part1(input)
      line_segments = input.split("\n").map { |row| row.split(' -> ').map { |point| point.split(',').map(&:to_i) } }

      line_segments.select! do |points|
        points.first[0] == points.last[0] || points.first[1] == points.last[1]
      end

      max_x = 0
      max_y = 0

      line_segments.each do |points|
        max_x = [max_x, points.first[0], points.last[0]].max
        max_y = [max_y, points.first[1], points.last[1]].max
      end

      grid = Array.new(max_y+1) { Array.new(max_x+1, 0) }

      line_segments.each do |points|
        if points.first[0] == points.last[0]
          # x is equal
          x = points.first[0]
          range = points.first[1] < points.last[1] ? points.first[1]..points.last[1] : points.last[1]..points.first[1]
          range.each do |y|
            grid[y][x] += 1
          end
        else
          # y is equal
          y = points.first[1]
          range = points.first[0] < points.last[0] ? points.first[0]..points.last[0] : points.last[0]..points.first[0]
          range.each do |x|
            grid[y][x] += 1
          end
        end
      end

      calculate_score(grid, max_x, max_y)
    end

    def part2(input)
      line_segments = input.split("\n").map { |row| row.split(' -> ').map { |point| point.split(',').map(&:to_i) } }

      max_x = 0
      max_y = 0

      line_segments.each do |points|
        max_x = [max_x, points.first[0], points.last[0]].max
        max_y = [max_y, points.first[1], points.last[1]].max
      end

      grid = Array.new(max_y+1) { Array.new(max_x+1, 0) }

      line_segments.each do |points|
        if points.first[0] == points.last[0]
          # x is equal
          x = points.first[0]
          range = points.first[1] < points.last[1] ? points.first[1]..points.last[1] : points.last[1]..points.first[1]
          range.each do |y|
            grid[y][x] += 1
          end
        elsif points.first[1] == points.last[1]
          # y is equal
          y = points.first[1]
          range = points.first[0] < points.last[0] ? points.first[0]..points.last[0] : points.last[0]..points.first[0]
          range.each do |x|
            grid[y][x] += 1
          end
        else
          # 45-degree line
          x_op = points.first[0] < points.last[0] ? :+ : :-
          y_op = points.first[1] < points.last[1] ? :upto : :downto

          x = points.first[0]

          points.first[1].public_send(y_op, points.last[1]) do |y|
            grid[y][x] += 1
            x = x.public_send(x_op, 1)
          end
        end
      end

      calculate_score(grid, max_x, max_y)
    end

    private 

    def calculate_score(grid, max_x, max_y)
      score = 0

      for y in 0..max_y do 
        for x in 0..max_x do 
          score += 1 if grid[y][x] >= 2
        end
      end

      score
    end
  end
end
