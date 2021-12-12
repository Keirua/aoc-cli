module Year2021
  class Day02
    def part1(input)
      commands = input.split("\n").map(&:split)

      hpos = 0
      depth = 0

      commands.each do |command|
        if command.first == 'forward'
          hpos += command.last.to_i
        elsif command.first == 'up'
          depth -= command.last.to_i
        elsif command.first == 'down'
          depth += command.last.to_i
        end
      end

      hpos * depth
    end

    def part2(input)
      commands = input.split("\n").map(&:split)

      hpos = 0
      depth = 0
      aim = 0

      commands.each do |command|
        if command.first == 'forward'
          hpos += command.last.to_i
          depth += aim * command.last.to_i
        elsif command.first == 'up'
          aim -= command.last.to_i
        elsif command.first == 'down'
          aim += command.last.to_i
        end
      end

      hpos * depth
    end
  end
end
