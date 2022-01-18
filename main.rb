require_relative 'parser'

def main
    puts "Indicate the path to your log:"
    path = gets.chomp
    begin
        file = File.open(path, 'r')
    rescue
        raise "File not found"
    end
    parser = Parser.new(file)
    parser.print_first_line
    file.close
end

if __FILE__ == $0
    main
end
