module Year2021
  class Day06
    def part1(input)
      day_count = 80

      fish_states = input.split(',').map(&:to_i)

      for day in 1..day_count do 
        new_fish = fish_states.count { |fish_state| fish_state == 0 }

        fish_states.map! { |fish_state| fish_state > 6 ? fish_state - 1 : (fish_state - 1) % 7 }

        fish_states.push(*([8] * new_fish))
      end

      fish_states.length
    end

    def part2(input)
      day_count = 256

      fish_states = input.split(',').map(&:to_i)

      state_counts = {
        8 => 0,
        7 => 0,
        6 => 0,
        5 => 0,
        4 => 0,
        3 => 0,
        2 => 0,
        1 => 0,
        0 => 0
      }

      fish_states.each { |fish_state| state_counts[fish_state] += 1 }

      for day in 1..day_count do 
        new_fish = state_counts[0]

        previous_state_counts = state_counts.dup 

        previous_state_counts.each do |key, value|
          next if value == 0

          if key > 6
            state_counts[key-1] += value
          else
            state_counts[(key - 1) % 7] += value
          end

          state_counts[key] -= value
        end

        state_counts[8] += new_fish
      end

      total_fish = 0
      
      state_counts.each do |key, value|
        total_fish += value
      end

      total_fish
    end
  end
end
