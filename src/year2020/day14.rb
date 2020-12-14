require 'ostruct'

module Year2020
  class Day14
    def part1(input)
      lines = input.split("\n")

      current_mask = nil
      mem = {}

      lines.each do |line|
        matches = line.match(/^(mask = )(.*)$/)

        if matches
          current_mask = matches[2].chars
          next
        end

        matches = line.match(/^(mem\[)([0-9]+)(\] = )([0-9]+)$/)

        mem_index = matches[2]
        value = format('%036d', matches[4].to_i.to_s(2))

        current_mask.each.with_index do |char, i|
          value[i] = char unless char == 'X'
        end

        mem[mem_index] = value.to_i(2)
      end

      mem.values.sum
    end

    def part2(input)
      lines = input.split("\n")

      current_mask = nil
      mem = {}

      lines.each do |line|
        matches = line.match(/^(mask = )(.*)$/)

        if matches
          current_mask = matches[2].chars
          next
        end

        matches = line.match(/^(mem\[)([0-9]+)(\] = )([0-9]+)$/)

        value = matches[4].to_i
        mem_index = format('%036d', matches[2].to_i.to_s(2))

        current_mask.each.with_index do |char, i|
          mem_index[i] = char unless char == '0'
        end

        addresses = []

        mem_index.chars.each do |char|
          if addresses.empty?
            if char == 'X'
              addresses << '0'
              addresses << '1'
            else
              addresses << char
            end

            next
          end

          if char != 'X'
            addresses.map! do |address|
              address + char
            end
          else
            dupes = addresses.dup
            addresses.map! do |address|
              address + '0'
            end
            dupes.map! do |address|
              address + '1'
            end
            addresses.push(*dupes)
          end
        end

        addresses.map! { |address| address.to_i(2) }
        addresses.each do |address|
          mem[address] = value
        end
      end

      mem.values.sum
    end
  end
end
