require 'spec_helper'

RSpec.describe Year2021::Day16 do
  let(:literal_packet) do
    <<~EOF
      D2FE28
    EOF
  end

  let(:operator_packet) do
    <<~EOF
      38006F45291200
    EOF
  end

  it "solves part1" do
    d = Year2021::Day16.new
    expect(d.part1(literal_packet)).to eq(nil)
    expect(d.part1(operator_packet)).to eq(nil)
  end

  it "solves part2" do
    d = Year2021::Day16.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
