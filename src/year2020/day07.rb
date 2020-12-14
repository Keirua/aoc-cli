module Year2020
  class Day07
    def part1(input)
      rules = input.split("\n").each_with_object({}) do |rule, hash|
        matches = rule.match(/^([a-z ]+)( bags contain )(.*)\.$/)
        parent = matches[1]
        matches[3].split(', ').each do |child|
          hash[parent] = Set[] unless hash[parent]
          children = child.match(/^([0-9]) ([a-z ]+)( bag[s]?)$/)
          hash[parent].add(children[2]) if children
        end
      end

      count = 0

      rules.each do |parent, children|
        count += 1 if path_exists?(rules, parent, 'shiny gold')
      end

      count
    end

    def part2(input)
      rules = input.split("\n").each_with_object({}) do |rule, hash|
        matches = rule.match(/^([a-z ]+)( bags contain )(.*)\.$/)
        parent = matches[1]
        matches[3].split(', ').each do |child|
          hash[parent] = {} unless hash[parent]
          children = child.match(/^([0-9]) ([a-z ]+)( bag[s]?)$/)
          hash[parent][children[2]] = children[1].to_i if children
        end
      end

      count_bags(rules, 'shiny gold')
    end

    private

    def path_exists?(rules, parent, target)
      children = rules[parent]
      return false unless children
      return true if children.include?(target)

      children.each do |child|
        return true if path_exists?(rules, child, target)
      end

      false
    end

    def count_bags(rules, parent)
      children = rules[parent]
      sum = 0

      children.each do |bag_type, count|
        sum += count + count * count_bags(rules, bag_type)
      end

      sum
    end
  end
end
