require 'spec_helper'

RSpec.describe Year2020::Day11 do
  let(:sample) do
    <<~EOF
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    EOF
  end

  it "solves part1" do
    d = Year2020::Day11.new
    expect(d.part1(sample)).to eq(37)
  end

  it "solves part2" do
    d = Year2020::Day11.new
    expect(d.part2(sample)).to eq(26)
  end
end
