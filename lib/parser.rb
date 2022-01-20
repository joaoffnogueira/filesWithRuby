# frozen_string_literal: true

require 'json'

class Parser
  def initialize(path)
    @path = path
    begin
      @file = File.open(path, 'r')
    rescue
      raise 'File not found'
    end
  end

  def print_first_line
    @file.readline
  end

  def close
    @file.close
  end

  def output
    full_path = File.expand_path(@path)
    json = {
      full_path => {
        'lines' => count_lines()
      }
    }
    JSON.pretty_generate(json)
  end

  def count_lines
    @file.readlines.size
  end
end
