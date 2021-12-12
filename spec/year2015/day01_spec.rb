require 'spec_helper'

RSpec.describe Year2015::Day01 do
  let(:sample) do 
    <<~EOF
      )())())
    EOF
  end

  let(:sample2) do 
    <<~EOF
      ()())
    EOF
  end

  it "solves part1" do
    d = Year2015::Day01.new
    expect(d.part1(sample)).to eq(-3)
  end

  it "solves part2" do
    d = Year2015::Day01.new
    expect(d.part2(sample2)).to eq(5)
  end
end
