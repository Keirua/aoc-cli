require 'spec_helper'

RSpec.describe Year2021::Day11 do
  let(:sample) do 
    <<~EOF
      5483143223
      2745854711
      5264556173
      6141336146
      6357385478
      4167524645
      2176841721
      6882881134
      4846848554
      5283751526
    EOF
  end

  let(:sample_easy) do 
    <<~EOF
    11111
    19991
    19191
    19991
    11111
    EOF
  end

  it "solves part1" do
    d = Year2021::Day11.new
    expect(d.part1(sample)).to eq(1656)
  end

  it "solves part2" do
    d = Year2021::Day11.new
    expect(d.part2(sample)).to eq(195)
  end
end
