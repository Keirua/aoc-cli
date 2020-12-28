module Year2020
  class Day24
    TRANSFORMATIONS = {
      e: [2, 0],
      w: [-2, 0],
      nw: [-1, 1],
      ne: [1, 1],
      se: [1, -1],
      sw: [-1, -1],
    }

    def part1(input)
      run_commands(input).size
    end

    def part2(input)
      black_tiles = run_commands(input)

      100.times do
        new_black_tiles = Set[]

        min_x = black_tiles.map { |coord| coord[0] }.min
        max_x = black_tiles.map { |coord| coord[0] }.max
        min_y = black_tiles.map { |coord| coord[1] }.min
        max_y = black_tiles.map { |coord| coord[1] }.max

        ((min_x - 2)..(max_x + 2)).each do |x|
          ((min_y - 2)..(max_y + 2)).each do |y|
            neighbours = []
            TRANSFORMATIONS.each do |key, value|
              neighbours << [x + TRANSFORMATIONS[key][0], y + TRANSFORMATIONS[key][1]]
            end

            adjacent_blacks = neighbours.reduce(0) { |sum, neighbour| black_tiles === neighbour ? sum + 1 : sum }

            if black_tiles === [x, y]
              if (1..2).cover?(adjacent_blacks)
                new_black_tiles.add([x, y])
              end
            else
              if adjacent_blacks == 2
                new_black_tiles.add([x, y])
              end
            end
         end
        end

        black_tiles = new_black_tiles
      end

      black_tiles.size
    end

    private

    def run_commands(input)
      lines = input.split("\n")
      lines.map! do |line|
        commands = []
        line.scan(/(e|se|sw|w|nw|ne)/) { |command| commands += command }
        commands.map(&:to_sym)
      end

      black_tiles = Set[]

      lines.each do |commands|
        x = 0
        y = 0

        commands.each do |command|
          x += TRANSFORMATIONS[command][0]
          y += TRANSFORMATIONS[command][1]
        end

        if black_tiles === [x, y]
          black_tiles.delete([x, y])
        else
          black_tiles.add([x, y])
        end
      end

      black_tiles
    end
  end
end
