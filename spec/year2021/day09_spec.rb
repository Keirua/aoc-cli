require 'spec_helper'

RSpec.describe Year2021::Day09 do
  let(:sample) do 
    <<~EOF
      2199943210
      3987894921
      9856789892
      8767896789
      9899965678
    EOF
  end

  it "solves part1" do
    d = Year2021::Day09.new
    expect(d.part1(sample)).to eq(15)
  end

  it "solves part2" do
    d = Year2021::Day09.new
    expect(d.part2(sample)).to eq(1134)
  end
end
