module Year2020
  class Day05
    ROW_COUNT = 128
    COLUMN_COUNT = 8

    def part1(input)
      boarding_passes = input.split("\n")

      max_seat_id = 0

      boarding_passes.each do |boarding_pass|
        row_portion = boarding_pass[0..6].chars
        column_portion = boarding_pass[7..9].chars

        row = find_value(row_portion, ROW_COUNT)
        column = find_value(column_portion, COLUMN_COUNT)

        seat_id = row * 8 + column
        max_seat_id = [max_seat_id, seat_id].max
      end

      max_seat_id
    end

    def part2(input)
      boarding_passes = input.split("\n")

      seat_ids = boarding_passes.map do |boarding_pass|
        row_portion = boarding_pass[0..6].chars
        column_portion = boarding_pass[7..9].chars

        row = find_value(row_portion, ROW_COUNT)
        column = find_value(column_portion, COLUMN_COUNT)

        row * 8 + column
      end.sort

      seat_ids.each.with_index do |seat_id, i|
        next if i == 0
        next if seat_id - seat_ids[i-1] == 1

        return seat_id - 1
      end
    end

    private

    def find_value(codes, maximum)
      range = 0...maximum

      codes.each do |code|
        case code
        when 'F', 'L'
          range = range.min..(range.min + ((range.max - range.min) / 2))
        when 'B', 'R'
          range = (((range.max - range.min) / 2) + range.min + 1)..range.max
        end
      end

      range.min
    end
  end
end
