module Year2020
  class Day12
    DIRECTIONS = ['N', 'E', 'S', 'W'].freeze

    def initialize
      @x = 0
      @y = 0
      @direction = 1
      @waypoint_x = 10
      @waypoint_y = 1
    end

    def part1(input)
      commands = input.split("\n").map { |command| [command[0], command[1..].to_i] }

      commands.each do |command|
        case command[0]
        when 'F'
          move(DIRECTIONS[@direction], command[1])
        when 'N'
          move('N', command[1])
        when 'E'
          move('E', command[1])
        when 'S'
          move('S', command[1])
        when 'W'
          move('W', command[1])
        when 'L'
          @direction = (@direction - (command[1] / 90)) % DIRECTIONS.size
        when 'R'
          @direction = (@direction + (command[1] / 90)) % DIRECTIONS.size
        end
      end

      @x.abs + @y.abs
    end

    def part2(input)
      @x = 0
      @y = 0
      @direction = 1
      @waypoint_x = 10
      @waypoint_y = 1

      commands = input.split("\n").map { |command| [command[0], command[1..].to_i] }

      commands.each do |command|
        case command[0]
        when 'F'
          @x += command[1] * @waypoint_x
          @y += command[1] * @waypoint_y
        when 'N'
          move_waypoint('N', command[1])
        when 'E'
          move_waypoint('E', command[1])
        when 'S'
          move_waypoint('S', command[1])
        when 'W'
          move_waypoint('W', command[1])
        when 'L'
          rotate_waypoint('L', command[1])
        when 'R'
          rotate_waypoint('R', command[1])
        end
      end

      @x.abs + @y.abs
    end

    private

    def move(direction, distance)
      case direction
      when 'N'
        @y += distance
      when 'E'
        @x += distance
      when 'S'
        @y -= distance
      when 'W'
        @x -= distance
      end
    end

    def move_waypoint(direction, distance)
      case direction
      when 'N'
        @waypoint_y += distance
      when 'E'
        @waypoint_x += distance
      when 'S'
        @waypoint_y -= distance
      when 'W'
        @waypoint_x -= distance
      end
    end

    def rotate_waypoint(direction, degrees)
      return if degrees == 0

      x, y = case degrees
      when 180
        [-@waypoint_x, -@waypoint_y]
      when 90
        if direction == 'L'
          [-@waypoint_y, @waypoint_x]
        else
          [@waypoint_y, -@waypoint_x]
        end
      when 270
        if direction == 'L'
          [@waypoint_y, -@waypoint_x]
        else
          [-@waypoint_y, @waypoint_x]
        end
      end

      @waypoint_x = x
      @waypoint_y = y
    end
  end
end
