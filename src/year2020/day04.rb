module Year2020
  class Day04
    MANDATORY_KEYS = [
      'byr',
      'iyr',
      'eyr',
      'hgt',
      'hcl',
      'ecl',
      'pid',
    ].freeze

    def part1(input)
      passports = parse_passports(input)

      valid_count = 0

      passports.each do |passport|
        valid_count += 1 if (MANDATORY_KEYS - passport.keys).empty?
      end

      valid_count
    end

    def part2(input)
      passports = parse_passports(input)

      valid_count = 0

      passports.each do |passport|
        next unless (MANDATORY_KEYS - passport.keys).empty? &&
          passport['byr'].to_i.between?(1920, 2002) &&
          passport['iyr'].to_i.between?(2010, 2020) &&
          passport['eyr'].to_i.between?(2020, 2030) &&
          height_valid?(passport['hgt']) &&
          passport['hcl'].match?(/#([0-9a-f]){6}/) &&
          passport['ecl'].match?(/(amb|blu|brn|gry|grn|hzl|oth)/) &&
          passport['pid'].match?(/^[0-9]{9}$/)
        valid_count += 1
      end

      valid_count
    end

    private

    def parse_passports(input)
      input.split("\n\n").map(&:split).map do |passport|
        passport.map { |pair| pair.split(':') }.to_h
      end
    end

    def height_valid?(height)
      matches = height.match(/(\d+)(cm|in)/)
      return false unless matches

      if matches[2] == 'cm'
        matches[1].to_i.between?(150, 193)
      else
        matches[1].to_i.between?(59, 76)
      end
    end
  end
end
