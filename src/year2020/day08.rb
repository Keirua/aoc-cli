module Year2020
  class Day08
    def part1(input)
      instructions = input.split("\n").map(&:split)
      visited = {}

      accumluator = 0
      index = 0

      loop do
        instruction = instructions[index]
        code = instruction[0]
        delta = instruction[1].to_i

        break if visited[index]

        visited[index] = true

        if code == 'nop'
          index += 1
          next
        elsif code == 'acc'
          accumluator += delta
          index += 1
          next
        elsif code == 'jmp'
          index += delta
          next
        end
      end

      accumluator
    end

    def part2(input)
      instructions = input.split("\n").map(&:split)

      accumluator = 0

      instructions.each do |instruction|
        if instruction[0] == 'nop'
          instruction[0] = 'jmp'
          fixed, accumluator = try_solution(instructions)
          break if fixed
          instruction[0] = 'nop'
        elsif instruction[0] == 'jmp'
          instruction[0] = 'nop'
          fixed, accumluator = try_solution(instructions)
          break if fixed
          instruction[0] = 'jmp'
        else
          next
        end
      end

      accumluator
    end

    private

    def try_solution(instructions)
      visited = {}
      fixed = false
      accumluator = 0
      index = 0

      loop do
        if index == instructions.size
          fixed = true
          break
        end

        instruction = instructions[index]
        code = instruction[0]
        delta = instruction[1].to_i

        break if visited[index]

        visited[index] = true

        if code == 'nop'
          index += 1
          next
        elsif code == 'acc'
          accumluator += delta
          index += 1
          next
        elsif code == 'jmp'
          index += delta
          next
        end
      end

      [fixed, accumluator]
    end
  end
end
