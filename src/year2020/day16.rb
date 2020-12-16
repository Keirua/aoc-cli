module Year2020
  class Day16
    def part1(input)
      lines = input.split("\n")

      ranges = []
      lines.each do |line|
        break if line.empty?

        matches = line.match(/^([a-z :]+)([0-9]+)-([0-9]+)( or )([0-9]+)-([0-9]+)$/)
        ranges << (matches[2].to_i..matches[3].to_i)
        ranges << (matches[5].to_i..matches[6].to_i)
      end

      nearby_tickets = lines[(lines.index('nearby tickets:') + 1)..].map do |ticket|
        ticket.split(',').map(&:to_i)
      end

      bad_numbers = []

      nearby_tickets.flatten.each do |number|
        bad_numbers << number if ranges.none? { |range| range.cover?(number) }
      end

      bad_numbers.sum
    end

    def part2(input)
      lines = input.split("\n")

      ranges = {}

      lines.each do |line|
        break if line.empty?

        matches = line.match(/^([a-z :]+)([0-9]+)-([0-9]+)( or )([0-9]+)-([0-9]+)$/)

        ranges[matches[1][0..-3]] = [
          (matches[2].to_i..matches[3].to_i),
          (matches[5].to_i..matches[6].to_i)
        ]
      end

      my_ticket = lines[lines.index('your ticket:') + 1].split(',').map(&:to_i)

      nearby_tickets = lines[(lines.index('nearby tickets:') + 1)..].map do |ticket|
        ticket.split(',').map(&:to_i)
      end

      all_ranges = ranges.values.flatten

      nearby_tickets.filter! do |ticket|
        ticket.all? do |number|
          all_ranges.any? { |range| range.cover?(number) }
        end
      end

      candidate_positions = {}

      ranges.each do |key, value|
        candidate_positions[key] = []

        (0...my_ticket.size).each do |position|
          to_check = nearby_tickets.map { |ticket| ticket[position] }
          position_is_candidate = to_check.all? do |number|
            value.any? { |range| range.cover?(number) }
          end
          candidate_positions[key] << position if position_is_candidate
        end
      end

      loop do
        singles = candidate_positions.select { |_key, value| value.size == 1 }.values.flatten
        candidate_positions.each do |key, value|
          candidate_positions[key] = value - singles if value.size > 1
        end
        break if candidate_positions.all? { |_key, value| value.size == 1 }
      end

      result = {}

      candidate_positions.each do |key, value|
        result[key] = my_ticket[value[0]]
      end

      result
    end
  end
end
