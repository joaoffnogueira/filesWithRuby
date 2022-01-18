require_relative 'parser'

def main
    puts "Indicate the path to your log:"
    path = gets.chomp
    file = File.open(path, 'r')
    raise "File not found" unless File.exists?(file)
    parser = Parser.new(file)
    parser.print_first_line
    file.close
end

if __FILE__ == $0
    main
end
