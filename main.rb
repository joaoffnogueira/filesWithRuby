require_relative 'lib/parser'

def main
  puts "Indicate the path to your log:"
  path = gets.chomp
  parser = Parser.new(path)
  parser.print_first_line
  parser.close
end

if __FILE__ == $0
  main
end
