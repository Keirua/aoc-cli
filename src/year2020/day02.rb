module Year2020
  class Day02
    def part1(input)
      rows = input.split("\n")
      valid_passwords = 0

      rows.each do |row|
        row_items = row.split(' ')

        range = row_items[0].split('-').map(&:to_i)
        character = row_items[1].delete_suffix(':')
        password = row_items[2]

        character_count = password.count(character)
        valid_passwords += 1 if character_count.between?(range.first, range.last)
      end

      valid_passwords
    end

    def part2(input)
      rows = input.split("\n")
      valid_passwords = 0

      rows.each do |row|
        row_items = row.split(' ')

        indices = row_items[0].split('-').map do |index|
          index.to_i - 1 # 1-based to 0-based
        end
        character = row_items[1].delete_suffix(':')
        password = row_items[2]

        valid_passwords += 1 if (password[indices[0]] == character) ^ (password[indices[1]] == character)
      end

      valid_passwords
    end
  end
end
