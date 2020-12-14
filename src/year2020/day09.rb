module Year2020
  class Day09
    def part1(input, preamble_length = 25)
      numbers = input.split("\n").map(&:to_i)

      bad_number = nil

      numbers.each.with_index do |number, index|
        next if index < preamble_length

        possible_sums = numbers[(index - preamble_length)...index].combination(2).map do |combo|
          combo.reduce(&:+)
        end

        next if possible_sums.include?(number)

        bad_number = number
        break
      end

      bad_number
    end

    def part2(input, preamble_length = 25)
      numbers = input.split("\n").map(&:to_i)

      bad_number = part1(input, preamble_length)
      encryption_weakness = nil

      numbers.each.with_index do |number, index|
        sum = number
        j = index

        loop do
          sum += numbers[j + 1]
          j += 1
          break if sum >= bad_number
        end

        if sum == bad_number
          contiguous = numbers[index..j]
          encryption_weakness = contiguous.min + contiguous.max
          break
        end
      end

      encryption_weakness
    end
  end
end
