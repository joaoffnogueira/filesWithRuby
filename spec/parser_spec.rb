# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  context 'if file not found' do
    it 'raises exception' do
      expect { Parser.new('./not_found.log') }.to raise_error(RuntimeError, 'File not found')
    end
  end

  context 'file exists' do
    it 'so open the file' do
      file = File.open('./spec/test.log', 'r')

      expect(File.exists?(file)).to be true
    end
  end
end

RSpec.describe '#print_first_line' do
  context 'log is test.log' do
    it 'and parser prints its first line' do
      file = File.open('./spec/test.log', 'r')
      parser = Parser.new(file)

      expect(parser.print_first_line).to eq("first line of test.log\r\n")
    end
  end
end

RSpec.describe '#count_lines' do
  context 'log is test.log' do
    it 'and parser counts its lines' do
      file = File.open('./spec/test.log', 'r')
      parser = Parser.new(file)

      expect(parser.count_lines).to eq(10)
    end
  end
end

RSpec.describe '#output' do
  context 'log is test.log' do
    it 'parser puts returns as json' do
      file = File.open('./spec/test.log', 'r')
      parser = Parser.new(file)
      full_path = File.expand_path(file)
      @players = Set['João', 'JavaScript']

      expect(parser.output).to eq("{\n  \"#{full_path}\": {\n    \"lines\": 10,\n    \"players\": [\n      \"João\",\n      \"JavaScript\"\n    ]\n  }\n}")
    end
  end
end

RSpec.describe '#parse_file_hotspots' do
  context 'log is test.log' do
    it 'parser gets the hotspots of information' do
      @path = './spec/test.log'
      parser = Parser.new(@path)
      parser.parse_file_hotspots

      expect(@hotspots.inspect).to eq("João killed JavaScript")
    end
  end
end

RSpec.describe '#find_players' do
  context 'log is test.log' do
    it 'parser gets the hotspots of information' do
      @hotspots = ['João killed JavaScript']
      @path = './spec/test.log'
      parser = Parser.new(@path)
      parser.find_players

      expect(@players.to_a).to eq('João', 'JavaScript')
    end
  end
end
