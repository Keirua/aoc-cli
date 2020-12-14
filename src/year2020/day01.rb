require 'byebug'

module Year2020
  class Day01
    def part1(input)
      entries = input.split("\n").map(&:to_i)

      numbers = entries.combination(2).find do |combo|
        combo.reduce(&:+) == 2020
      end

      numbers.reduce(&:*)
    end

    def part2(input)
      entries = input.split("\n").map(&:to_i)

      numbers = entries.combination(3).find do |combo|
        combo.reduce(&:+) == 2020
      end

      numbers.reduce(&:*)
    end
  end
end
