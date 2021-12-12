module Year2021
  class Day01
    def part1(input)
      depths = input.split("\n").map(&:to_i)

      greater_than = 0

      depths.each.with_index do |depth, index| 
        next if index == 0
        greater_than += 1 if depth > depths[index-1] 
      end

      greater_than
    end

    def part2(input)
      depths = input.split("\n").map(&:to_i)

      windows = []
      
      depths.each.with_index do |depth, index| 
        windows << depths[index..index+2].sum
      end

      greater_than = 0

      windows.each.with_index do |window, index| 
        next if index == 0
        greater_than += 1 if window > windows[index-1] 
      end

      greater_than
    end
  end
end
