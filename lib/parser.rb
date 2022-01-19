require_relative '../lib/to_json'

class Parser

  def initialize(path)
    @path = path
    begin
        @file = File.open(path, 'r')
    rescue
        raise "File not found"
    end
  end

  def print_first_line
    puts @file.readline
  end
  
  def close
    @file.close
  end

  def count_lines
    lines = 0
    @file.each_line do |line|
      lines += 1
    end
    full_path = File.expand_path(@file)
    print = ToJSON.new(full_path, lines)
    print.to_json
  end
    
end
