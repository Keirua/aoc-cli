require 'fileutils'

# Template management
class Template
  def self.create_templates(year, day)
    source_directory = puzzle_source_directory(year)

    FileUtils.mkdir_p(source_directory) if !Dir.exist?(source_directory)
    PuzzleCache.skip_if_exists(puzzle_source_path(year, day)) do
      File.open(puzzle_source_path(year, day), 'w') do |f|
        f.write puzzle_source(year, day)
      end
    end

    spec_directory = spec_source_directory(year)
    FileUtils.mkdir_p(spec_directory) if !Dir.exist?(spec_directory)
    PuzzleCache.skip_if_exists(spec_source_path(year, day)) do
      File.open(spec_source_path(year, day), 'w') do |f|
        f.write spec_source(year, day)
      end
    end
  end

  def self.puzzle_source_directory(year)
    File.join('src', "year#{year}")
  end

  def self.puzzle_source_path(year, day)
    day = Day.pad(day)
    File.join(puzzle_source_directory(year), "day#{day}.rb")
  end

  def self.spec_source_directory(year)
    File.join('spec', "year#{year}")
  end

  def self.spec_source_path(year, day)
    day = Day.pad(day)
    File.join(spec_source_directory(year), "day#{day}_spec.rb")
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

  def self.spec_source(year, day)
    day = Day.pad(day)

    <<~TPL
      require 'spec_helper'

      RSpec.describe Year#{year}::Day#{day} do
        it "solves part1" do
          d = Year#{year}::Day#{day}.new
          expect(d.part1('some_input')).to eq('expected_result')
        end

        it "solves part2" do
          d = Year#{year}::Day#{day}.new
          expect(d.part2('some_input')).to eq(nil)
        end
      end
    TPL
  end
end
