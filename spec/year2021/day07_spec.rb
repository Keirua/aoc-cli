require 'spec_helper'

RSpec.describe Year2021::Day07 do
  let(:sample) { '16,1,2,0,4,2,7,1,2,14' }
  
  it "solves part1" do
    d = Year2021::Day07.new
    expect(d.part1(sample)).to eq(37)
  end

  it "solves part2" do
    d = Year2021::Day07.new
    expect(d.part2(sample)).to eq(168)
  end
end
