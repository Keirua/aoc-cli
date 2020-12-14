module Year2020
  class Day13
    def part1(input)
      lines = input.split("\n")
      earliest_timestamp = lines[0].to_i

      bus_ids = lines[1].split(',').filter { |id| id != 'x' }.map(&:to_i)

      min_waiting = 1000000000
      best_bus = nil

      bus_ids.each do |bus_id|
        time = 0
        loop do
          time += bus_id
          break if time > earliest_timestamp
        end

        if time < min_waiting
          min_waiting = time
          best_bus = bus_id
        end
      end

      (min_waiting - earliest_timestamp) * best_bus
    end

    def part2(input)
      lines = input.split("\n")
      bus_ids = lines[1].split(',').map { |bus_id| bus_id == 'x' ? bus_id : bus_id.to_i }
      filtered_ids = bus_ids.filter { |id| id != 'x' }

      time = 0

      loop do
        ok_count = 0
        found = []

        bus_ids.each.with_index do |bus_id, i|
          if bus_id == 'x'
            ok_count += 1
            next
          end

          if (time + i) % bus_id == 0
            ok_count += 1
            found << bus_id
          else
            break
          end
        end

        break if ok_count == bus_ids.size
        increment = found.reduce(&:lcm)
        time += increment
      end

      time
    end
  end
end
