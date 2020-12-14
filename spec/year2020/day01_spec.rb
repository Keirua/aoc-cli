require 'spec_helper'

RSpec.describe Year2020::Day01 do
  let(:sample) do
    <<~EOF
      1721
      979
      366
      299
      675
      1456
    EOF
  end

  it "solves part1" do
    d = Year2020::Day01.new
    expect(d.part1(sample)).to eq(514579)
  end

  it "solves part2" do
    d = Year2020::Day01.new
    expect(d.part2(sample)).to eq(241861950)
  end
end
