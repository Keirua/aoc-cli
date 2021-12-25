module Year2021
  class Day16
    def part1(input)
      # binary_string = [input.strip].pack('H*').unpack('B*').first

      # version_sum = parse_packet(binary_string)
      nil
    end

    def part2(input)
      nil
    end

    private 

    def parse_packet(packet)
      version = packet[0..2].to_i(2)
      type_id = packet[3..5].to_i(2)

      version_sum = version

      if type_id == 4
        # version_sum += literal_packet(binary_string[6..])
      else
        version_sum += operator_packet(binary_string[6..])
      end
    end

    def literal_packet(data)
      literal = ''

      data.split('').each_slice(5) do |bit_group|
        literal += bit_group[1..].join
        break if bit_group[0] == '0'
      end

      literal = literal.to_i(2)
    end

    def operator_packet(data)
      if data[0] == '0'
        # next 15 bytes contain length of subpackets
      end
    end
  end
end
