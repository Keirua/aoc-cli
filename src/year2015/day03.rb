module Year2015
  class Day03
    def part1(input)
      houses = {}
      x = 0
      y = 0

      houses[[x, y]] = House.new(visits: 1)

      input.each_char do |c|
        case c 
        when '^'
          y += 1
        when '<'
          x -= 1
        when '>'
          x += 1
        when 'v'
          y -= 1
        end

        house = houses[[x, y]]
        if house.nil? 
          houses[[x, y]] = House.new(visits: 1)
        else
          house.visits = house.visits + 1
        end
      end

      houses.length
    end

    def part2(input)
      santa_houses = {}
      santa_x = 0
      santa_y = 0
      santa_houses[[santa_x, santa_y]] = House.new(visits: 1)

      robo_houses = {}
      robo_x = 0
      robo_y = 0
      robo_houses[[robo_x, robo_y]] = House.new(visits: 1)

      input.each_char.with_index do |c, index|
        robo = index % 2 == 1

        case c 
        when '^'
          robo ? robo_y += 1 : santa_y += 1
        when '<'
          robo ? robo_x -= 1 : santa_x -= 1
        when '>'
          robo ? robo_x += 1 : santa_x +=1
        when 'v'
          robo ? robo_y -= 1 : santa_y -= 1
        end

        x = robo ? robo_x : santa_x 
        y = robo ? robo_y : santa_y
        houses = robo ? robo_houses : santa_houses

        house = houses[[x, y]]
        if house.nil? 
          houses[[x, y]] = House.new(visits: 1)
        else
          house.visits = house.visits + 1
        end
      end

      (santa_houses.keys.to_set | robo_houses.keys.to_set).size
    end
  end

  class House
    attr_accessor :visits 

    def initialize(visits:)
      @visits = visits
    end

    private 

    @visits
  end
end
