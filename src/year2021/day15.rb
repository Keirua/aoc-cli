require 'rgl/adjacency'
require 'rgl/dijkstra'

module Year2021
  class Day15
    def part1(input)
      matrix = input.split("\n").map { |row| row.split('').map(&:to_i) }
      graph = RGL::DirectedAdjacencyGraph.new

      max_x_index = matrix.first.length-1
      max_y_index = matrix.length-1

      vertices = (0..max_x_index).to_a.product((0..max_y_index).to_a)
      graph.add_vertices(vertices)

      # graph.add_vertices "Los Angeles", "New York", "Chicago", "Houston", "Seattle"
      # edge_weights =
      # {
      #   ["New York", "Los Angeles"] => 2445,
      #   ["Los Angeles", "Chicago"] => 2015,
      #   ["Los Angeles", "Houston"] => 1547,
      #   ["Chicago", "Houston"] => 939,
      #   ["Seattle", "Los Angeles"] => 1548
      # }
      # edge_weights.each { |(city1, city2), w| graph.add_edge(city1, city2, w)  }
      
      # byebug

      # edge_weights = vertices.reduce({}) do |hash, vertex|
      #   hash[vertex] = matrix[vertex[0]][vertex[1]]
      #   hash
      # end

      edge_weights = {}
      
      for i in 0..max_x_index
        for j in 0..max_y_index
          neighbour_coords(matrix, i, j, max_x_index, max_y_index).each do |neighbour|
            edge_weights[[[i, j], neighbour]] = matrix[neighbour[0]][neighbour[1]]
            graph.add_edge([i, j], neighbour)
          end
        end
      end

      shortest_path = graph.dijkstra_shortest_path(edge_weights, [0, 0], [max_x_index, max_y_index])

      weight = shortest_path[1..].reduce(0) do |total, vertex| 
        total += matrix[vertex[0]][vertex[1]]
      end

      weight
    end

    def part2(input)
      original_matrix = input.split("\n").map { |row| row.split('').map(&:to_i) }
      matrix = original_matrix.dup 

      # First expand down
      (1..4).each do |increment|
        original_matrix.each do |row|
          matrix << incremented_row(row, increment)
        end
      end

      # Next expand to the right
      matrix.each do |row| 
        original_row = row.dup 
        (1..4).each do |increment| 
          # byebug
          row.append(*incremented_row(original_row, increment))
        end
      end

      graph = RGL::DirectedAdjacencyGraph.new

      max_x_index = matrix.first.length-1
      max_y_index = matrix.length-1

      vertices = (0..max_x_index).to_a.product((0..max_y_index).to_a)
      graph.add_vertices(vertices)

      edge_weights = {}
      
      for i in 0..max_x_index
        for j in 0..max_y_index
          neighbour_coords(matrix, i, j, max_x_index, max_y_index).each do |neighbour|
            edge_weights[[[i, j], neighbour]] = matrix[neighbour[0]][neighbour[1]]
            graph.add_edge([i, j], neighbour)
          end
        end
      end

      shortest_path = graph.dijkstra_shortest_path(edge_weights, [0, 0], [max_x_index, max_y_index])

      weight = shortest_path[1..].reduce(0) do |total, vertex| 
        total += matrix[vertex[0]][vertex[1]]
      end

      weight
    end

    private 

    def neighbour_coords(matrix, i, j, max_x_index, max_y_index)
      neighbours = []
  
      # up
      neighbours << [i-1, j] if i > 0
        
      # down
      neighbours << [i+1, j] if i < max_y_index
        
      # left
      neighbours << [i, j-1] if j > 0
        
      # right
      neighbours << [i, j+1] if j < max_x_index
  
      neighbours
    end

    def incremented_row(row, increment)
      row.map { |value| (value+increment-1) % 9 + 1 }
    end
  end

#   1  function Dijkstra(Graph, source):
#   2
#   3      create vertex set Q
#   4
#   5      for each vertex v in Graph:            
#   6          dist[v] ← INFINITY                 
#   7          prev[v] ← UNDEFINED                
#   8          add v to Q                     
#   9      dist[source] ← 0                       
#  10     
#  11      while Q is not empty:
#  12          u ← vertex in Q with min dist[u]   
#  13                                             
#  14          remove u from Q
#  15         
#  16          for each neighbor v of u still in Q:
#  17              alt ← dist[u] + length(u, v)
#  18              if alt < dist[v]:              
#  19                  dist[v] ← alt
#  20                  prev[v] ← u
#  21
#  22      return dist[], prev[]  
end
