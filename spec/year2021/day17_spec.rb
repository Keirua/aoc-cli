require 'spec_helper'

RSpec.describe Year2021::Day17 do
  let(:sample) { 'target area: x=20..30, y=-10..-5' }

  it "solves part1" do
    d = Year2021::Day17.new
    expect(d.part1(sample)).to eq(45)
  end

  it "solves part2" do
    d = Year2021::Day17.new
    expect(d.part2(sample)).to eq(112)
  end
end
