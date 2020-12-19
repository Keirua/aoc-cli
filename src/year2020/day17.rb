module Year2020
  class Day17
    def part1(input)
      active_cubes = Set[]

      input.each_line(chomp: true).each_with_index do |row, y|
        row.each_char.each_with_index do |char, x|
          active_cubes << [x, y, 0] if char == '#'
        end
      end

      6.times do
        active_cubes = cycle(active_cubes)
      end

      active_cubes.count
    end

    def part2(input)
      active_cubes = Set[]

      input.each_line(chomp: true).each_with_index do |row, y|
        row.each_char.each_with_index do |char, x|
          active_cubes << [x, y, 0, 0] if char == '#'
        end
      end

      6.times do
        active_cubes = cycle(active_cubes, 4)
      end

      active_cubes.count
    end

    private

    def cycle(active_cubes, dim_count = 3)
      new_cubes = Set[]

      cubes_to_check = active_cubes.flat_map do |cube|
        surrounding_cubes(cube, dim_count, false)
      end.uniq

      cubes_to_check.each do |cube|
        active_neighbours = surrounding_cubes(cube, dim_count).filter { |neighbour| active_cubes.include?(neighbour) }.count
        if active_cubes.include?(cube) && (2..3).cover?(active_neighbours) ||
          !active_cubes.include?(cube) && active_neighbours == 3
          new_cubes << cube
        end
      end

      new_cubes
    end

    def surrounding_cubes(cube, dim_count, exclude_self = true)
      result = []

      if dim_count == 3
        x, y, z = cube

        # nicer solution!
        # c.map { |i| (i-1..i+1).to_a }.inject { |a, b| a.product(b) }.map(&:flatten)

        (x-1..x+1).each do |i|
          (y-1..y+1).each do |j|
            (z-1..z+1).each do |k|
              result << [i, j, k] unless exclude_self && i == x && j == y && k == z
            end
          end
        end
      else
        x, y, z, w = cube


        (x-1..x+1).each do |i|
          (y-1..y+1).each do |j|
            (z-1..z+1).each do |k|
              (w-1..w+1).each do |l|
                result << [i, j, k, l] unless exclude_self && i == x && j == y && k == z && l == w
              end
            end
          end
        end
      end

      result
    end
  end
end
