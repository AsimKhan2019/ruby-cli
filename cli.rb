require 'optparse'

class FishFinder
  attr_accessor :verbose, :filter

  def initialize
    self.verbose = false
  end

  def fish
    fish = self.verbose ? '🐠' : self.find_fish
    "I found a #{fish}"
  end

  def find_fish
    if self.filter == 'fresh'
      'goldfish'
    elsif self.filter == 'salt'
      'tuna'
    else
      'sturgeon'
    end
  end

  def parse
    OptionParser.new do |parser|
      parser.banner = "Usage: fish_finder.rb [options]"
      parser.separator ""

      parser.on('--water TYPE', /fresh|salt/, 'Pick "fresh" or "salt"') do |water|
        self.filter = water
      end

      parser.on('-h', '--help', 'Show this message') do
        puts parser
        exit
      end

      parser.on('-v', '--verbose', 'Show extra fish') do |v|
        self.verbose = v
      end
    end.parse!
  end
end

finder = FishFinder.new
finder.parse
puts finder.fish
