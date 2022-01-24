# frozen_string_literal: true

require 'json'
require 'set'

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

  def output
    @file = File.open(@path, 'r')
    parse_file_hotspots
    json = {
      @file.path => {
        'lines' => count_lines,
        'players' => find_players
      }
    }
    JSON.pretty_generate(json)
  end

  private

  def parse_file_hotspots
    expression1 = Regexp.new(/([A-z<>\s]+\skilled\s[A-z\s]{1,20})/)
    expression2 = Regexp.new(/^(?:(?!\sby).)*/)
    substrings = []
    @hotspots = []
    @file.readlines.each do |line|
      if line.match(expression1) !=nil then (substrings << line.match(expression1).captures).flatten!
      end
    end
    substrings.each do |substring|
      @hotspots << substring.to_s.lstrip.slice(expression2)
    end
    @hotspots
  end

  def count_lines
    @file = File.open(@path, 'r')
    @file.readlines.size
  end

  def find_players
    players = Set.new
    @hotspots.each do |hotspot|
      hotspot.to_s.split(' killed ', 2).each do |word|
        unless word == '<world>'
          players << word
        end
      end
    end
    players.to_a
  end
end
