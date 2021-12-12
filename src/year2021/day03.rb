module Year2021
  class Day03
    def part1(input)
      rows = input.split("\n").map { |row| row.split(//) }

      counts = calculate_counts(rows)

      gamma = []
      epsilon = []

      counts.each do |count| 
        if count[:zeroes] > count[:ones]
          gamma << '0'
          epsilon << '1'
        else
          gamma << '1'
          epsilon << '0'
        end
      end

      gamma = gamma.join.to_i(2)
      epsilon = epsilon.join.to_i(2)

      gamma * epsilon
    end

    def part2(input)
      rows = input.split("\n").map { |row| row.split(//) }

      oxygen_candidates = rows.dup
      co2_candidates = rows.dup 
      
      oxygen = oxygen(oxygen_candidates)
      co2 = co2(co2_candidates)

      oxygen * co2
    end

    private 

    def oxygen(rows)
      counts = calculate_counts(rows)
      bit_count = rows[0].length

      bit_count.times.with_index do |index|
        count = counts[index]

        if count[:ones] >= count[:zeroes]
          rows.select! { |row| row[index] == '1' }
        elsif count[:zeroes] > count[:ones]
          rows.select! { |row| row[index] == '0' }
        end

        break if rows.length == 1

        counts = calculate_counts(rows)
      end

      rows.first.join.to_i(2)
    end

    def co2(rows)
      counts = calculate_counts(rows)
      bit_count = rows[0].length

      bit_count.times.with_index do |index|
        count = counts[index]

        if count[:zeroes] < count[:ones]
          rows.select! { |row| row[index] == '0' }
        elsif count[:ones] < count[:zeroes]
          rows.select! { |row| row[index] == '1' }
        else
          rows.select! { |row| row[index] == '0' }
        end

        break if rows.length == 1

        counts = calculate_counts(rows)
      end

      rows.first.join.to_i(2)
    end

    def calculate_counts(rows)
      counts = []
      rows[0].length.times { counts << {zeroes: 0, ones: 0} }

      rows.each do |row| 
        row.each.with_index do |char, index| 
          if char == '0'
            counts[index][:zeroes] += 1
          else
            counts[index][:ones] += 1
          end
        end
      end

      counts
    end
  end
end
