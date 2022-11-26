module Year2015
  class Day02
    def part1(input)
      box_dims = input.split("\n")

      total = 0

      box_dims.each do |box_dim|
        length, width, height = box_dim.split("x").map(&:to_i)

        side_areas = [length*width, width*height, height*length]
        side_areas.each do |side_area|
          total += 2*side_area
        end

        total += side_areas.min
      end

      total
    end

    def part2(input)
      box_dims = input.split("\n")

      total = 0

      box_dims.each do |box_dim|
        length, width, height = box_dim.split("x").map(&:to_i)

        perimeters = [2*(length+width), 2*(width+height), 2*(height+length)]
        total += perimeters.min

        total += length*width*height
      end

      total
    end
  end
end
