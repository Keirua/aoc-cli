require 'spec_helper'

RSpec.describe Year2021::Day10 do
  let(:sample) do 
    <<~EOF
      [({(<(())[]>[[{[]{<()<>>
      [(()[<>])]({[<{<<[]>>(
      {([(<{}[<>[]}>{[]{[(<()>
      (((({<>}<{<{<>}{[]{[]{}
      [[<[([]))<([[{}[[()]]]
      [{[{({}]{}}([{[{{{}}([]
      {<[[]]>}<{[{[{[]{()[[[]
      [<(<(<(<{}))><([]([]()
      <{([([[(<>()){}]>(<<{{
      <{([{{}}[<[[[<>{}]]]>[]]    
    EOF
  end

  it "solves part1" do
    d = Year2021::Day10.new
    expect(d.part1(sample)).to eq(26397)
  end

  it "solves part2" do
    d = Year2021::Day10.new
    expect(d.part2(sample)).to eq(288957)
  end
end
