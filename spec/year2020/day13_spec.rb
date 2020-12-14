require 'spec_helper'

RSpec.describe Year2020::Day13 do
  let(:sample) do
    <<~EOF
      939
      7,13,x,x,59,x,31,19
    EOF
  end

  it "solves part1" do
    d = Year2020::Day13.new
    expect(d.part1(sample)).to eq(295)
  end

  it "solves part2" do
    d = Year2020::Day13.new
    expect(d.part2(sample)).to eq(1068781)
  end
end
