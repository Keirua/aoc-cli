require 'spec_helper'

RSpec.describe Year2015::Day03 do
  let(:sample) do 
    <<~EOF
      ^>v<
    EOF
  end

  it "solves part1" do
    d = Year2015::Day03.new
    expect(d.part1(sample)).to eq(4)
  end

  it "solves part2" do
    d = Year2015::Day03.new
    expect(d.part2(sample)).to eq(3)
  end
end
