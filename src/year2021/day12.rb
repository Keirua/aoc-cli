require 'set'

module Year2021
  class Day12
    class Cave 
      attr_accessor :label, :exits, :visited

      def initialize(label)
        @label = label
        @exits = Set.new
        @visited = false
      end

      private 

      def small_cave?
        /^[[:lower:]]+$/.match?(label)
      end
    end

    def part1(input)
      rows = input.split("\n")

      graph = {}

      rows.each do |row| 
        edge = row.split('-')
        start = edge.first
        finish = edge.last

        start_cave = graph[start] || Cave.new(start)
        finish_cave = graph[finish] || Cave.new(finish)

        graph[start] = start_cave
        graph[finish] = finish_cave

        start_cave.exits.add(finish_cave)
      end

      graph.each do |key, value|
        value.visited = false
      end

      paths = find_paths(graph['start'], [], graph, Set.new)

      paths.count
    end

    def part2(input)
      nil
    end

    private 

    def find_path(current, paths, graph, visited)
      visited.add(current)
      return paths if current.label == 'end'
    end
  end
end
