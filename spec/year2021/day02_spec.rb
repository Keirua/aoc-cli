require 'spec_helper'

RSpec.describe Year2021::Day02 do
  let(:sample) do
    <<~EOF
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    EOF
  end

  it "solves part1" do
    d = Year2021::Day02.new
    expect(d.part1(sample)).to eq(150)
  end

  it "solves part2" do
    d = Year2021::Day02.new
    expect(d.part2(sample)).to eq(900)
  end
end
