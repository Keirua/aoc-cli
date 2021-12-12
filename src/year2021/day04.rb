module Year2021
  class Day04
    def part1(input)
      called_numbers, boards = parse_input(input)

      current_called_number = nil 
      winning_board = nil 

      called_numbers.each do |called_number| 
        current_called_number = called_number

        mark_called_numbers(called_number, boards)

        boards.each do |board|
          if bingo?(board)
            winning_board = board
            break
          end
        end

        break if winning_board
      end

      board_score(winning_board) * current_called_number
    end

    def part2(input)
      called_numbers, boards = parse_input(input)

      current_called_number = nil 
      winning_boards = []

      called_numbers.each do |called_number| 
        current_called_number = called_number

        mark_called_numbers(called_number, boards)

        boards.each do |board|
          if bingo?(board)
            winning_boards << { board: board, score: board_score(board) * current_called_number }
            boards.delete(board)
          end
        end
      end

      winning_boards.last[:score]
    end

    private 

    def parse_input(input)
      rows = input.split("\n")

      called_numbers = rows[0].split(",").map(&:to_i)

      boards = []

      rows[2..].each_slice(6) do |board_rows|
        board = []

        board_rows[0..4].each do |board_row|
          board << board_row.split.map(&:to_i).map do |number|
            { number: number, selected: false }
          end
        end

        boards << board
      end

      [called_numbers, boards]
    end

    def mark_called_numbers(called_number, boards)
      boards.each do |board|
        board.each do |row| 
          row.each do |cell|
            cell[:selected] = true if called_number == cell[:number]
          end
        end
      end
    end

    def bingo?(board)
      row_win = board.any? do |row| 
        row.all? do |cell| 
          cell[:selected]
        end
      end

      column_win = false 

      5.times.with_index do |column_index|
        if board.all? { |row| row[column_index][:selected] }
          column_win = true 
          break
        end
      end

      row_win || column_win
    end

    def board_score(board)
      score = 0

      board.each do |row| 
        row.each do |cell|
          score += cell[:number] unless cell[:selected]
        end
      end

      score
    end
  end
end
