require 'spec_helper'

RSpec.describe Year2021::Day06 do
  let(:sample) { '3,4,3,1,2' }

  it "solves part1" do
    d = Year2021::Day06.new
    expect(d.part1(sample)).to eq(5934)
  end

  it "solves part2" do
    d = Year2021::Day06.new
    expect(d.part2(sample)).to eq(26984457539)
  end
end
