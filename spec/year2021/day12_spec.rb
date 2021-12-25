require 'spec_helper'

RSpec.describe Year2021::Day12 do
  let(:sample1) do 
    <<~EOF
      start-A
      start-b
      A-c
      A-b
      b-d
      A-end
      b-end
    EOF
  end

  let(:sample2) do 
    <<~EOF
      dc-end
      HN-start
      start-kj
      dc-start
      dc-HN
      LN-dc
      HN-end
      kj-sa
      kj-HN
      kj-dc
    EOF
  end

  let(:sample3) do 
    <<~EOF
      fs-end
      he-DX
      fs-he
      start-DX
      pj-DX
      end-zg
      zg-sl
      zg-pj
      pj-he
      RW-he
      fs-DX
      pj-RW
      zg-RW
      start-pj
      he-WI
      zg-he
      pj-fs
      start-RW
    EOF
  end

  it "solves part1" do
    d = Year2021::Day12.new
    expect(d.part2(sample1)).to eq(nil)
    # expect(d.part1(sample1)).to eq(10)
    # expect(d.part1(sample2)).to eq(19)
    # expect(d.part1(sample3)).to eq(226)
  end

  it "solves part2" do
    d = Year2021::Day12.new
    expect(d.part2(sample1)).to eq(nil)
  end
end
