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

      black_tiles.size
    end

    def part2(input)
      nil
    end
  end
end
