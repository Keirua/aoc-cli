module Year2020
  class Day03
    TREE = '#'
    OPEN = '.'

    def part1(input)
      pattern = input.split("\n").map!(&:chars)

      calculate_tree_count(pattern: pattern, right_move: 3, down_move: 1)
    end

    def part2(input)
      pattern = input.split("\n").map!(&:chars)

      [
        [1, 1],
        [3, 1],
        [5, 1],
        [7, 1],
        [1, 2]
      ].map do |moves|
        calculate_tree_count(pattern: pattern, right_move: moves[0], down_move: moves[1])
      end.reduce(&:*)
    end

    private

    def calculate_tree_count(pattern:, right_move:, down_move:)
      row_count = pattern.length
      column_count = pattern.first.length

      i = 0
      j = 0

      tree_count = 0

      while i < row_count
        tree_count += 1 if pattern[i][j] == TREE

        j = (j + right_move) % column_count
        i += down_move
      end

      tree_count
    end
  end
end
