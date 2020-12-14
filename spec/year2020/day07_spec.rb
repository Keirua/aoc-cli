require 'spec_helper'

RSpec.describe Year2020::Day07 do
  let(:sample_part1) do
    <<~EOF
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    EOF
  end

  let(:sample_part2) do
    <<~EOF
      shiny gold bags contain 2 dark red bags.
      dark red bags contain 2 dark orange bags.
      dark orange bags contain 2 dark yellow bags.
      dark yellow bags contain 2 dark green bags.
      dark green bags contain 2 dark blue bags.
      dark blue bags contain 2 dark violet bags.
      dark violet bags contain no other bags.
    EOF
  end

  it "solves part1" do
    d = Year2020::Day07.new
    expect(d.part1(sample_part1)).to eq(4)
  end

  it "solves part2" do
    d = Year2020::Day07.new
    expect(d.part2(sample_part1)).to eq(32)
    expect(d.part2(sample_part2)).to eq(126)
  end
end
