module Year2021
  class Day10
    OPENERS = ['[', '{', '<', '(']
    CLOSERS = [']', '}', '>', ')']

    CLOSERS_TO_OPENERS = {
      ']' => '[',
      '}' => '{',
      '>' => '<',
      ')' => '('
    }

    SCORES = {
      ']' => 57,
      '}' => 1197,
      '>' => 25137,
      ')' => 3
    }

    SCORES_2 = {
      '(' => 1,
      '[' => 2,
      '{' => 3,
      '<' => 4
    }

    def part1(input)
      rows = input.split("\n").map { |row| row.split('') }

      corrupt_rows = []
      score = 0 

      rows.each do |row| 
        stack = []

        row.each do |char| 
          if OPENERS.include?(char)
            stack.push(char)
          elsif CLOSERS.include?(char)
            previous = stack.pop
            if previous != CLOSERS_TO_OPENERS[char]
              corrupt_rows << row 
              score += SCORES[char]
              break
            end
          end
        end
      end

      score
    end

    def part2(input)
      rows = input.split("\n").map { |row| row.split('') }

      corrupt_rows = []

      rows.each do |row| 
        stack = []

        row.each do |char| 
          if OPENERS.include?(char)
            stack.push(char)
          elsif CLOSERS.include?(char)
            previous = stack.pop
            if previous != CLOSERS_TO_OPENERS[char]
              corrupt_rows << row 
              break
            end
          end
        end
      end

      incomplete_rows = rows - corrupt_rows
      
      scores = []

      incomplete_rows.each do |row| 
        stack = []

        row.each do |char|   
          if OPENERS.include?(char)
            stack.push(char)
          elsif CLOSERS.include?(char)
            previous = stack.pop
          end
        end

        stack.reverse!
        score = 0

        stack.each do |char| 
          score = 5 * score + SCORES_2[char]
        end

        scores << score
      end

      scores.sort[scores.length / 2]
    end
  end
end
