require 'spec_helper'

RSpec.describe Year2020::Day05 do
  let(:sample) do
    <<~EOF
      FBFBBFFRLR
      BFFFBBFRRR
      FFFBBBFRRR
      BBFFBBFRLL
    EOF
  end

  it "solves part1" do
    d = Year2020::Day05.new
    expect(d.part1(sample)).to eq(820)
  end

  # it "solves part2" do
  #   d = Year2020::Day05.new
  #   expect(d.part2('some_input')).to eq(nil)
  # end
end
