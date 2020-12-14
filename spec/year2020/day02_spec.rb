require 'spec_helper'

RSpec.describe Year2020::Day02 do
  let(:sample) do
    <<~EOF
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    EOF
  end


  it "solves part1" do
    d = Year2020::Day02.new
    expect(d.part1(sample)).to eq(2)
  end

  it "solves part2" do
    d = Year2020::Day02.new
    expect(d.part2(sample)).to eq(1)
  end
end
