module Year2021
  class Day17
    Position = Struct.new(:x, :y, keyword_init: true)

    def part1(input)
      matches = input.match(/target area: x=(-?\d+)\.\.(-?\d+), y=(-?\d+)\.\.(-?\d+)/)

      x_target = (matches[1].to_i)..(matches[2].to_i)
      y_target = (matches[3].to_i)..(matches[4].to_i)

      highest = 0

      velocity = nil 

      # (1..(x_target.end-1)).each do |x|
      #   (1..100).each do |y|
      (1..500).each do |x|
        (-500..500).each do |y|
          velocity = Position.new(x: x, y: y)
          success, max_y = attempt(x_target, y_target, velocity)
          highest = [max_y, highest].max if success
        end
      end

      highest
    end

    def part2(input)
      matches = input.match(/target area: x=(-?\d+)\.\.(-?\d+), y=(-?\d+)\.\.(-?\d+)/)

      x_target = (matches[1].to_i)..(matches[2].to_i)
      y_target = (matches[3].to_i)..(matches[4].to_i)

      successful = 0

      velocity = nil 

      # (1..(x_target.end-1)).each do |x|
      #   (1..100).each do |y|
      (1..500).each do |x|
        (-500..500).each do |y|
          velocity = Position.new(x: x, y: y)
          success, max_y = attempt(x_target, y_target, velocity)
          successful += 1 if success
        end
      end

      successful
    end

    private

    def attempt(x_target, y_target, velocity)
      success = false
      current_pos = Position.new(x: 0, y: 0)
      max_y = 0 

      while true do 
        current_pos.x += velocity.x 
        current_pos.y += velocity.y
        velocity.x += if velocity.x > 0
          -1
        elsif velocity.x < 0
          1
        else
          0
        end
        velocity.y -= 1

        max_y = [current_pos.y, max_y].max

        if x_target.cover?(current_pos.x) && y_target.cover?(current_pos.y)
          success = true 
          break
        end

        break if current_pos.x > x_target.end || current_pos.y < y_target.first
      end

      [success, max_y]
    end
  end
end
