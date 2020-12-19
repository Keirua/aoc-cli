require 'spec_helper'

RSpec.describe Year2020::Day18 do
  let(:sample) do
    <<~EOF
      1 + 2 * 3 + 4 * 5 + 6
      1 + (2 * 3) + (4 * (5 + 6))
      2 * 3 + (4 * 5)
      5 + (8 * 3 + 9 + 3 * 4 * 3)
      5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))
      ((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2
    EOF
  end

  it "solves part1" do
    d = Year2020::Day18.new
    expect(d.part1(sample)).to eq(26457)
  end

  it "solves part2" do
    d = Year2020::Day18.new
    expect(d.part2(sample)).to eq(694173)
  end
end
