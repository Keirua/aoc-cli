require 'httparty'
require 'dotenv/load'

class AoC
  include HTTParty
  base_uri 'adventofcode.com'

  def initialize(year, session)
    @year = year
    @options = { headers: {"Cookie" => "session=#{session}"} }
  end

  def day(d)
    self.class.get("/#{@year}/day/#{d}/input", @options)
  end
end

aoc = AoC.new(2018, ENV["AOC_COOKIE"])
puts aoc.day(4)