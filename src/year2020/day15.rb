module Year2020
  class Day15
    def part1(input)
      solve(input, 2020)
    end

    def part2(input)
      solve(input, 30000000)
    end

    private

    def solve(input, final_turn)
      numbers = input.split(',').map(&:to_i)

      instance_positions = {}

      numbers.each.with_index do |number, i|
        instance_positions[number] = [] if instance_positions[number].nil?
        instance_positions[number] << i
      end

      turn = numbers.size

      while turn < final_turn
        last_turn_number = numbers[turn - 1]

        if instance_positions[last_turn_number].size == 1
          numbers << 0
          instance_positions[0] = [] if instance_positions[0].nil?
          instance_positions[0] << turn
        else
          next_number = instance_positions[last_turn_number][-1] - instance_positions[last_turn_number][-2]
          numbers << next_number
          instance_positions[next_number] = [] if instance_positions[next_number].nil?
          instance_positions[next_number] << turn
        end

        turn += 1
      end

      numbers[-1]
    end
  end
end
