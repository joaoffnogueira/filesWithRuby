require_relative 'lib/parser'

def main
  puts "Indicate the path to your log:"
  path = gets.chomp
  parser = Parser.new(path)
  puts (parser.print_first_line)
  lines = parser.count_lines
  full_path = File.expand_path(path)
  print = ToJSON.new(full_path, lines)
  puts (print.to_json)
  parser.close
end

if __FILE__ == $0
  main
end
