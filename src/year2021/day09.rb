module Year2021
  class Day09
    def part1(input)
      height_map = input.split("\n").map { |row| row.split('').map(&:to_i) }

      total = 0

      height_map.each.with_index do |row, i| 
        row.each.with_index do |height, j|
          neighbours = neighbours(height_map, i, j)
          candidate = height_map[i][j]

          total += candidate + 1 if candidate < neighbours.min
        end
      end

      total
    end

    def part2(input)
      height_map = input.split("\n").map { |row| row.split('').map(&:to_i) }

      low_points = []

      height_map.each.with_index do |row, i| 
        row.each.with_index do |height, j|
          neighbours = neighbours(height_map, i, j)
          candidate = height_map[i][j]

          low_points << [i, j] if candidate < neighbours.min
        end
      end

      basins = []
      low_points.each do |low_point| 
        basins << find_basin(height_map, [], low_point)
      end

      basins.map { |basin| basin.size }.sort[-3..-1].reduce(&:*)
    end

    private

    def find_basin(height_map, basin, current)
      neighbours = neighbour_coords(height_map, current.first, current.last)

      basin << current 

      neighbours.each do |neighbour| 
        next if basin.include?(neighbour)

        current_value = height_map[current.first][current.last]
        neighbour_value = height_map[neighbour.first][neighbour.last]

        next if neighbour_value == 9 

        if neighbour_value > current_value
          find_basin(height_map, basin, neighbour)
        end
      end

      basin
    end

    def neighbour_coords(height_map, i, j)
      grid_width = height_map.first.length 
      grid_height = height_map.length
      neighbours = []

      # up
      neighbours << [i-1, j] if i > 0
        
      # down
      neighbours << [i+1, j] if i < grid_height - 1 
        
      # left
      neighbours << [i, j-1] if j > 0
        
      # right
      neighbours << [i, j+1] if j < grid_width - 1 

      neighbours
    end

    def neighbours(height_map, i, j)
      grid_width = height_map.first.length 
      grid_height = height_map.length
      neighbours = []

      # up
      neighbours << height_map[i-1][j] if i > 0
        
      # down
      neighbours << height_map[i+1][j] if i < grid_height - 1 
        
      # left
      neighbours << height_map[i][j-1] if j > 0
        
      # right
      neighbours << height_map[i][j+1] if j < grid_width - 1 

      neighbours
    end
  end
end
