require 'spec_helper'

RSpec.describe Year2020::Day06 do
  let(:sample) do
    <<~EOF
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    EOF
  end

  it "solves part1" do
    d = Year2020::Day06.new
    expect(d.part1(sample)).to eq(11)
  end

  it "solves part2" do
    d = Year2020::Day06.new
    expect(d.part2(sample)).to eq(6)
  end
end
