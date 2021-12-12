require 'spec_helper'

RSpec.describe Year2021::Day01 do
  let(:sample) do
    <<~EOF
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    EOF
  end

  it "solves part1" do
    d = Year2021::Day01.new
    expect(d.part1(sample)).to eq(7)
  end

  it "solves part2" do
    d = Year2021::Day01.new
    expect(d.part2(sample)).to eq(5)
  end
end
