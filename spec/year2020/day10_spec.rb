require 'spec_helper'

RSpec.describe Year2020::Day10 do
  let(:sample) do
    <<~EOF
      16
      10
      15
      5
      1
      11
      7
      19
      6
      12
      4
    EOF
  end

  it "solves part1" do
    d = Year2020::Day10.new
    expect(d.part1(sample)).to eq(35)
  end

  it "solves part2" do
    d = Year2020::Day10.new
    expect(d.part2(sample)).to eq(8)
  end
end
