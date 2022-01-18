require_relative 'log'
require_relative 'parser'

def main
    puts "Indicate the path to your log:"
    path = gets.chomp
    log = Log.new(File.new(path))
    parser = Parser.new(log)
    parser.print_first_line
end

if __FILE__ == $0
    main
end