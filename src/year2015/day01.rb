module Year2015
  class Day01
    def part1(input)
      floor = 0

      input.split('').each do |command|
        case command
        when '('
          floor += 1
        when ')'
          floor -= 1
        end
      end

      floor
    end

    def part2(input)
      first_basement_pos = nil
      floor = 0

      input.split('').each.with_index do |command, index|
        case command
        when '('
          floor += 1
        when ')'
          floor -= 1
        end

        if floor == -1 
          first_basement_pos = index + 1
          break
        end
      end

      first_basement_pos
    end
  end
end
