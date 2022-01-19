require_relative 'lib/parser'

def main
  puts "Indicate the path to your log:"
  path = gets.chomp
  parser = Parser.new(path)
  puts (parser.print_first_line)
  puts (parser.output)
  parser.close
end

if __FILE__ == $0
  main
end
