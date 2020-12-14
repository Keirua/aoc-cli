module Year2020
  class Day06
    def part1(input)
      input.split("\n\n").map { |group| group.tr("\n", '') }.map(&:chars).map(&:uniq).map(&:count).reduce(&:+)
    end

    def part2(input)
      input.split("\n\n").map { |group| group.split("\n") }.map do |group|
        group.map { |person| person.split('') }.reduce(&:&)
      end.map(&:count).reduce(&:+)
    end
  end
end
