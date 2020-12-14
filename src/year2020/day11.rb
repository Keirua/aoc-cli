module Year2020
  class Day11
    def part1(input)
      layout = input.split("\n").map!(&:chars)
      previous_layout = nil

      loop do
        previous_layout = layout
        layout = apply_rules_part1(layout)
        break if previous_layout == layout
      end

      occupied_seats = 0

      layout.each do |row|
        row.each do |cell|
          occupied_seats += 1 if cell == '#'
        end
      end

      occupied_seats
    end

    def part2(input)
      layout = input.split("\n").map!(&:chars)
      previous_layout = nil

      loop do
        previous_layout = layout
        layout = apply_rules_part2(layout)
        break if previous_layout == layout
      end

      occupied_seats = 0

      layout.each do |row|
        row.each do |cell|
          occupied_seats += 1 if cell == '#'
        end
      end

      occupied_seats
    end

    private

    def apply_rules_part1(layout)
      new_layout = Marshal.load(Marshal.dump(layout))

      layout.each.with_index do |row, i|
        row.each.with_index do |cell, j|
          if layout[i][j] == 'L' && !occupied_adjacent?(layout, i, j)
            new_layout[i][j] = '#'
          elsif layout[i][j] == '#' && occupied_adjacent_count(layout, i, j) >= 4
            new_layout[i][j] = 'L'
          end
        end
      end

      new_layout
    end

    def apply_rules_part2(layout)
      new_layout = Marshal.load(Marshal.dump(layout))

      layout.each.with_index do |row, i|
        row.each.with_index do |cell, j|
          if layout[i][j] == 'L' && !occupied_visible?(layout, i, j)
            new_layout[i][j] = '#'
          elsif layout[i][j] == '#' && occupied_visible_count(layout, i, j) >= 5
            new_layout[i][j] = 'L'
          end
        end
      end

      new_layout
    end

    def occupied_adjacent?(layout, i, j)
      adjacent_cells_to_check(layout, i, j).any? { |cell| cell == '#' }
    end

    def occupied_adjacent_count(layout, i, j)
      adjacent_cells_to_check(layout, i, j).count { |cell| cell == '#' }
    end

    def adjacent_cells_to_check(layout, i, j)
      row_count = layout.size
      column_count = layout[0].size

      cells_to_check = []
      cells_to_check.push(layout[i-1][j-1]) if i > 0 && j > 0
      cells_to_check.push(layout[i-1][j]) if i > 0
      cells_to_check.push(layout[i-1][j+1]) if i > 0 && j < column_count-1
      cells_to_check.push(layout[i][j-1]) if j > 0
      cells_to_check.push(layout[i][j+1]) if j < column_count-1
      cells_to_check.push(layout[i+1][j-1]) if i < row_count-1 && j > 0
      cells_to_check.push(layout[i+1][j]) if i < row_count-1
      cells_to_check.push(layout[i+1][j+1]) if i < row_count-1 && j < column_count-1

      cells_to_check
    end

    def occupied_visible?(layout, i, j)
      visible_cells_to_check(layout, i, j).any? { |cell| cell == '#' }
    end

    def occupied_visible_count(layout, i, j)
      visible_cells_to_check(layout, i, j).count { |cell| cell == '#' }
    end

    def visible_cells_to_check(layout, i, j)
      row_count = layout.size
      column_count = layout[0].size

      cells_to_check = []

      # north
      row_index = i - 1
      column_index = j

      while row_index >= 0 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        row_index -= 1
      end

      # northeast
      row_index = i - 1
      column_index = j + 1

      while row_index >= 0 && column_index <= column_count-1 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        row_index -= 1
        column_index += 1
      end

      # east
      row_index = i
      column_index = j + 1

      while column_index <= column_count-1 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        column_index += 1
      end

      # southeast
      row_index = i + 1
      column_index = j + 1

      while row_index <= row_count-1 && column_index <= column_count-1 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        row_index += 1
        column_index += 1
      end

      # south
      row_index = i + 1
      column_index = j

      while row_index <= row_count-1 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        row_index += 1
      end

      # southwest
      row_index = i + 1
      column_index = j - 1

      while row_index <= row_count-1 && column_index >= 0 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        row_index += 1
        column_index -= 1
      end

      # west
      row_index = i
      column_index = j - 1

      while column_index >= 0 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        column_index -= 1
      end

      # northwest
      row_index = i - 1
      column_index = j - 1

      while row_index >= 0 && column_index >= 0 do
        cells_to_check.push(layout[row_index][column_index])
        break if layout[row_index][column_index] == '#' || layout[row_index][column_index] == 'L'
        row_index -= 1
        column_index -= 1
      end

      # if i == 0 && j == 3
      #   byebug
      # end

      cells_to_check
    end
  end
end
