require 'spec_helper'

RSpec.describe Year2018::Day02 do
  it "finds the sequences in which letters appear 2 and 3 times" do
    d = Year2018::Day02.new
    expect(d.compute_checksum('abcdef')).to eq([0, 0])
    expect(d.compute_checksum('bababc')).to eq([1, 1])
    expect(d.compute_checksum('abbcde')).to eq([1, 0])
    expect(d.compute_checksum('abcccd')).to eq([0, 1])
    expect(d.compute_checksum('aabcdd')).to eq([1, 0])
  end

  it "finds the offsets where there are differences between 2 strings" do
    d = Year2018::Day02.new
    expect(d.find_differences_offset('abc', 'bbc')).to eq([0])
    expect(d.find_differences_offset('aac', 'bbc')).to eq([0, 1])
    expect(d.find_differences_offset('aaa', 'bbc')).to eq([0, 1, 2])
    expect(d.find_differences_offset('aba', 'abc')).to eq([2])
  end
end
