module Year2020
  class Day10
    def part1(input)
      numbers = input.split("\n").map(&:to_i).sort
      numbers.unshift(0)
      numbers << numbers[-1] + 3

      differences = []

      numbers.each.with_index do |number, i|
        next if i == 0
        differences << number - numbers[i - 1]
      end

      difference_counts = differences.group_by { |e| e }.map { |k, v| [k, v.length]}.to_h

      difference_counts[1] * difference_counts[3]
    end

    def part2(input)
      numbers = input.split("\n").map(&:to_i).sort
      numbers.unshift(0)
      numbers << numbers[-1] + 3

      arrangements(numbers, {})
    end

    private

    def arrangements(numbers, results)
      return results[numbers] if results[numbers]
      return 1 if numbers.length == 1

      total = 0

      total += arrangements(numbers[1..], results) if numbers.length >= 2
      total += arrangements(numbers[2..], results) if numbers.length >= 3 && numbers[2] - numbers[0] <= 3
      total += arrangements(numbers[3..], results) if numbers.length >= 4 && numbers[3] - numbers[0] <= 3

      results[numbers] = total
      total
    end
  end
end
