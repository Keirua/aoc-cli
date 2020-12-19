module Year2020
  class Day18
    def part1(input)
      expressions = input.split("\n").map { |expression| expression.tr(' ', '') }.map(&:chars)

      results = []

      expressions.each do |expression|
        results << solve(expression, :eval_simple_part1)
      end

      results.sum
    end

    def part2(input)
      expressions = input.split("\n").map { |expression| expression.tr(' ', '') }.map(&:chars)

      results = []

      expressions.each do |expression|
        results << solve(expression, :eval_simple_part2)
      end

      results.sum
    end

    private

    def solve(expression, evaluator)
      close_paren_index = expression.index(')')
      return send(evaluator, expression) unless close_paren_index

      index = close_paren_index
      index -= 1 while expression[index] != '('

      new_expression = []
      new_expression.push(*expression[0..index - 1]) if index > 0
      new_expression.push(send(evaluator, expression[index + 1..close_paren_index - 1]))
      new_expression.push(*expression[close_paren_index + 1..]) if close_paren_index < expression.size - 1

      solve(new_expression, evaluator)
    end

    def eval_simple_part1(expression)
      if expression.size == 1
        expression[0].to_i
      elsif expression[1] == '*'
        new_expression = [expression[0].to_i * expression[2].to_i]
        new_expression.push(*expression[3..])
        eval_simple_part1(new_expression)
      elsif expression[1] == '+'
        new_expression = [expression[0].to_i + expression[2].to_i]
        new_expression.push(*expression[3..])
        eval_simple_part1(new_expression)
      end
    end

    def eval_simple_part2(expression)
      if expression.size == 1
        expression[0].to_i
      elsif expression.index('+')
        first = expression.index('+') - 1
        second = first + 2
        sum = expression[first].to_i + expression[second].to_i

        new_expression = []
        new_expression.push(*expression[0..first - 1]) if first > 0
        new_expression << sum
        new_expression.push(*expression[second+1..]) if second < expression.size - 1
        eval_simple_part2(new_expression)
      elsif expression[1] == '*'
        new_expression = [expression[0].to_i * expression[2].to_i]
        new_expression.push(*expression[3..])
        eval_simple_part2(new_expression)
      end
    end
  end
end
