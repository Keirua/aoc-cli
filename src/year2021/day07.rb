module Year2021
  class Day07
    def part1(input)
      horizontal_positions = input.split(',').map(&:to_i)

      candidates = (horizontal_positions.min)..(horizontal_positions.max)

      scores = candidates.map do |candidate| 
        horizontal_positions.sum do |horizontal_position|
          (horizontal_position - candidate).abs
        end
      end

      scores.min
    end

    def part2(input)
      horizontal_positions = input.split(',').map(&:to_i)

      candidates = (horizontal_positions.min)..(horizontal_positions.max)

      scores = candidates.map do |candidate|
        horizontal_positions.sum do |horizontal_position|
          n = (horizontal_position - candidate).abs
          (n * (n + 1)) / 2
        end
      end

      scores.min
    end
  end
end
