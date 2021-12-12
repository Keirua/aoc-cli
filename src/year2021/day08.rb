require 'set'

module Year2021
  class Day08
    def part1(input)
      rows = input.split("\n")
      output_values = rows.map { |row| row.split(' | ').last.split(' ') }.flatten
      output_values.select { |value| [2, 3, 4, 7].include?(value.length) }.count
    end

    def part2(input)
      rows = input.split("\n")

      total = 0

      rows.each do |row|
        signals, output_values = row.split(' | ').map { |values| values.split(' ') }

        signal_to_number_map = {}

        signals.map! { |signal| signal.split('').to_set }

        signals.each do |signal| 
          case signal.length
          when 2
            signal_to_number_map[signal] = 1
          when 3
            signal_to_number_map[signal] = 7
          when 4
            signal_to_number_map[signal] = 4
          when 7
            signal_to_number_map[signal] = 8
          end
        end

        number_to_signal_map = signal_to_number_map.invert

        signals.each do |signal| 
          case signal.length
          when 6
            # 0, 6 or 9
            difference = (number_to_signal_map[8] - signal)

            if [number_to_signal_map[1], number_to_signal_map[4], number_to_signal_map[7]].none? { |set| set.intersect?(difference) }
              signal_to_number_map[signal] = 9
            elsif number_to_signal_map[4].intersect?(difference) && !number_to_signal_map[1].intersect?(difference) && !number_to_signal_map[7].intersect?(difference) && 
              signal_to_number_map[signal] = 0
            else
              signal_to_number_map[signal] = 6
            end
          end
        end


        number_to_signal_map = signal_to_number_map.invert

        signals.each do |signal| 
          case signal.length
          when 5
            # 2, 3 or 5
            difference_from_six = (number_to_signal_map[6] - signal)
            difference_from_eight = (number_to_signal_map[8] - signal)

            if [number_to_signal_map[1], number_to_signal_map[4], number_to_signal_map[7]].none? { |set| set.intersect?(difference_from_six) }
              signal_to_number_map[signal] = 5
            elsif [number_to_signal_map[1], number_to_signal_map[7]].none? { |set| set.intersect?(difference_from_eight) }
              signal_to_number_map[signal] = 3
            else
              signal_to_number_map[signal] = 2
            end
          end
        end


        number_to_signal_map = signal_to_number_map.invert

        output_values.map! { |output| output.split('').to_set }

        solution = ""
        output_values.each do |output| 
          solution += signal_to_number_map[output].to_s
        end

        total += solution.to_i 
      end

      total
    end
  end
end
