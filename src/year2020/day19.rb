module Year2020
  class Day19
    def part1(input)
      lines = input.split("\n")

      rules = {}
      messages = []

      lines.each do |line|
        next if line.empty?

        matches = line.match(/^([0-9]+)(: )(.*)/)
        if matches
          rule_number = matches[1].to_i
          rule_text = matches[3]
          if rule_text.match?(/"/)
            rules[rule_number] = LiteralRule.new(rule_text.delete_prefix('"').delete_suffix('"'))
          elsif rule_text.index('|')
            predicates = rule_text.split(' | ')
            rules[rule_number] = OrRule.new(
              SequenceRule.new(rules, predicates[0].split(' ').map(&:to_i)),
              SequenceRule.new(rules, predicates[1].split(' ').map(&:to_i))
            )
          elsif rule_text.match(/[0-9]/)
            rules[rule_number] = SequenceRule.new(rules, rule_text.split(' ').map(&:to_i))
          end
        else
          messages << line
        end
      end

      match_count = 0

      messages.each_with_index do |message, i|
        puts message
        # if i == 1
        #   byebug
        # end
        match_count += 1 if rules[0].matches?(message)
      end

      match_count
    end

    def part2(input)
      nil
    end
  end

  class LiteralRule
    def initialize(literal)
      @literal = literal
    end

    def matches?(text)
      @literal == text
    end
  end

  class SequenceRule
    def initialize(rules, sequence)
      @rules = rules
      @sequence = sequence
    end

    def matches?(text)
      puts text
      k = @sequence.length
      combinations = (0..text.length).to_a.repeated_combination(k - 1).map{|a| [0, *a, -1].each_cons(2).map{|i, j| "#{text} "[i...j]}}
      combinations = combinations.map { |a| a.reject(&:empty?) }.reject { |a| a.length != k }
      combinations.any? do |combination|
        good_combo = true
        @sequence.each_with_index do |rule, i|
          unless @rules[rule].matches?(combination[i])
            good_combo = false
            break
          end
        end
        good_combo
      end
    end
  end

  class OrRule
    def initialize(rule_1, rule_2)
      @rule_1 = rule_1
      @rule_2 = rule_2
    end

    def matches?(text)
      @rule_1.matches?(text) || @rule_2.matches?(text)
    end
  end
end
