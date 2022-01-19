require 'json'

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
    @file.readline
  end
  
  def close
    @file.close
  end

  def count_lines
    @lines = @file.readlines.size
  end
  
  def output
    self.count_lines
    full_path = File.expand_path(@path)
    json = {
      full_path => {
        "lines" => @lines
      } 
    }
    JSON.pretty_generate(json)
  end
  
end
