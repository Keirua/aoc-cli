require 'spec_helper'

RSpec.describe Year2020::Day03 do
  let(:sample) do
    <<~EOF
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    EOF
  end

  it "solves part1" do
    d = Year2020::Day03.new
    expect(d.part1(sample)).to eq(7)
  end

  it "solves part2" do
    d = Year2020::Day03.new
    expect(d.part2(sample)).to eq(336)
  end
end
