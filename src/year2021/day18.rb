module Year2021
  class Day18
    def part1(input)
      rows = input.split("\n")

      sum = rows[0] 

      # rows[1..].each do |row|
      #   sum = do_sum(('[' + sum + ',' + row + ']').split(''))
      # end
      do_sum('[[[[[9,8],1],2],3],4]'.split(''))
      nil
    end

    def part2(input)
      nil
    end

    private 

    def do_sum(pair)
      done = false 

      until done do 
        did_explode = explode(pair, 0) 
        did_split = false 

        done = !(did_explode || did_split)
      end

      pair.join
    end

    def explode(pair, depth)
      return false #if pair.blank?

      if depth == 4
        # do some stuff
      end

      explode(pair[1,-1], depth)
    end
  end
end
