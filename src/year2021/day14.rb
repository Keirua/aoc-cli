module Year2021
  class Day14
    def part1(input)
      rows = input.split("\n")

      rules = {}
      rows[2..].each do |row| 
        parsed_row = row.split(' -> ')
        rules[parsed_row.first] =  parsed_row.last
      end

      max_steps = 10
      polymer = rows.first 

      for i in 1..max_steps do 
        pairs = polymer.split('').each_cons(2).map { |pair| pair.join }
        next_polymer = ''
        pairs.each.with_index do |pair, index| 
          next_polymer += pair[0] + rules[pair]
          next_polymer += pair[1] if index == pairs.length-1
        end

        polymer = next_polymer
      end

      letter_counts = Hash.new(0)
      polymer.each_char do |char|
        letter_counts[char] += 1
      end

      letter_counts.values.max - letter_counts.values.min
    end

    def part2(input)
      rows = input.split("\n")

      rules = {}
      pair_counts = Hash.new(0)

      rows[2..].each do |row| 
        parsed_row = row.split(' -> ')
        rules[parsed_row.first] = parsed_row.last
        pair_counts[parsed_row.first] = 0
      end

      max_steps = 40
      polymer = rows.first 
      pairs = polymer.split('').each_cons(2).map { |pair| pair.join }

      pairs.each do |pair| 
        pair_counts[pair] += 1
      end

      for i in 1..max_steps do 
        new_pair_counts = pair_counts.dup

        pair_counts.each do |key, value| 
          new_pair_counts[key] -= value
          new_pair_counts[key[0] + rules[key]] += value
          new_pair_counts[rules[key] + key[1]] += value
        end

        pair_counts = new_pair_counts
      end

      letter_counts = Hash.new(0)
      pair_counts.each do |key, value|
        letter_counts[key[0]] += value
        letter_counts[key[1]] += value
      end

      letter_counts[polymer[0]] += 1
      letter_counts[polymer[-1]] += 1

      letter_counts.each { |key, value| letter_counts[key] = value / 2 }
      letter_counts.values.max - letter_counts.values.min
    end
  end
end
