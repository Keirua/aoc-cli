module Year2021
  class Day11
    def part1(input)
      rows = input.split("\n").map { |row| row.split('').map(&:to_i) }

      step = 0
      max_steps = 100
      flash_count = 0

      max_steps.times do
        rows.each.with_index do |row, i| 
          row.each.with_index do |cell, j| 
            rows[i][j] = cell + 1
          end
        end

        flashed = Array.new(rows.size) {Array.new(rows.first.size, false) }

        while true
          did_flash = false
  
          rows.each.with_index do |row, i| 
            row.each.with_index do |cell, j| 
              next if flashed[i][j]
              next if cell <= 9
  
              did_flash = true
              flash_count += 1
              flashed[i][j] = true
              
              neighbours = neighbours(rows, i, j)
              neighbours.each do |neighbour| 
                rows[neighbour.first][neighbour.last] += 1
              end
            end
          end

          break unless did_flash
        end 

        rows.each.with_index do |row, i| 
          row.each.with_index do |cell, j| 
            rows[i][j] = cell > 9 ? 0 : cell
          end
        end
      end

      flash_count
    end

    def part2(input)
      rows = input.split("\n").map { |row| row.split('').map(&:to_i) }

      step = 1
      flash_count = 0

      while true do
        rows.each.with_index do |row, i| 
          row.each.with_index do |cell, j| 
            rows[i][j] = cell + 1
          end
        end

        flashed = Array.new(rows.size) {Array.new(rows.first.size, false) }

        while true
          did_flash = false
  
          rows.each.with_index do |row, i| 
            row.each.with_index do |cell, j| 
              next if flashed[i][j]
              next if cell <= 9
  
              did_flash = true
              flash_count += 1
              flashed[i][j] = true
              
              neighbours = neighbours(rows, i, j)
              neighbours.each do |neighbour| 
                rows[neighbour.first][neighbour.last] += 1
              end
            end
          end

          break unless did_flash
        end 

        rows.each.with_index do |row, i| 
          row.each.with_index do |cell, j| 
            rows[i][j] = cell > 9 ? 0 : cell
          end
        end

        break if rows.all? { |row| row.all? { |cell| cell == 0 } }

        step += 1
      end

      step
    end

    private 

    def neighbours(rows, i, j)
      grid_width = rows.first.length 
      grid_height = rows.length
      neighbours = []

      # top left
      neighbours << [i-1, j-1] if i > 0 && j > 0

      # up
      neighbours << [i-1, j] if i > 0
      
      # top right 
      neighbours << [i-1, j+1] if i > 0 && j < grid_width - 1 

      # down
      neighbours << [i+1, j] if i < grid_height - 1 
      
      # bottom left 
      neighbours << [i+1, j-1] if i < grid_height - 1 && j > 0

      # bottom right 
      neighbours << [i+1, j+1] if i < grid_height - 1 && j < grid_width - 1 

      # left
      neighbours << [i, j-1] if j > 0
        
      # right
      neighbours << [i, j+1] if j < grid_width - 1 

      neighbours
    end

  end
end
