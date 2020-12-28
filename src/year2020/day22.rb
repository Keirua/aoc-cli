module Year2020
  class Day22
    def part1(input)
      decks = input.split("\n\n")
      decks.map! do |deck|
        deck.split("\n").drop(1).map(&:to_i)
      end

      loop do
        winner = [decks[0][0], decks[1][0]].each_with_index.max[1]
        loser = (winner + 1) % 2

        decks[winner] << decks[winner][0] << decks[loser][0]
        decks[winner] = decks[winner].drop(1)
        decks[loser] = decks[loser].drop(1)

        break if decks.any?(&:empty?)
      end

      winning_deck = decks.find { |deck| !deck.empty? }
      winning_deck.reverse.each_with_index.reduce(0) do |sum, (card, index)|
        sum + (index + 1) * card
      end
    end

    def part2(input)
      nil
    end
  end
end
