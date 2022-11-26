require 'spec_helper'

RSpec.describe Year2015::Day02 do
  let(:sample) do 
    <<~EOF
      2x3x4
      1x1x10
    EOF
  end

  it "solves part1" do
    d = Year2015::Day02.new
    expect(d.part1(sample)).to eq(101)
  end

  it "solves part2" do
    d = Year2015::Day02.new
    expect(d.part2(sample)).to eq(48)
  end
end
