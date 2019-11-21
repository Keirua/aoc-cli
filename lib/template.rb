# Template management
class Template
  def self.create_templates(year, day)
    PuzzleCache.skip_if_exists(puzzle_source_path(year, day)) do
      File.open(puzzle_source_path(year, day), 'w') do |f|
        f.write puzzle_source(year, day)
      end
    end
  end

  def self.puzzle_source_path(year, day)
    day = Day.pad(day)
    File.join('src', "year#{year}", "day#{day}.rb")
  end

  def self.puzzle_source(year, day)
    day = Day.pad(day)

    <<~TPL
      module Year#{year}
        class Day#{day}
          def part1(input)
            "expected_result"
          end

          def part2(input)
            nil
          end
        end
      end
    TPL
  end
end
