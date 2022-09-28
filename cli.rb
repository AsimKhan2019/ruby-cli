#ruby
#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |parser| 
  parser.on("-n", "--n NAME", "The name of the person") do |value|
    options[:name] = value
  end=
end.parse!

puts 'Hello ' + options[:name]