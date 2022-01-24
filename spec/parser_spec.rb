# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  describe '#initialize' do
    context 'if file not found' do
      it 'raises exception' do
        expect { Parser.new('./not_found.log') }.to raise_error(RuntimeError, 'File not found')
      end
    end

    context 'file exists' do
      it 'so open the file' do
        file = File.open('./spec/test.log', 'r')

        expect(File.exist?(file)).to be true
      end
    end
  end

  describe '#print_first_line' do
    context 'log is test.log' do
      it 'and parser prints its first line' do
        file = File.open('./spec/test.log', 'r')
        parser = Parser.new(file)

        expect(parser.print_first_line).to eq("first line of test.log\r\n")
      end
    end
  end

  describe '#output' do
    context 'log is test.log' do
      it 'parser puts returns as json' do
        file = File.open('./spec/test.log', 'r')
        parser = Parser.new(file)

        expect(parser.output).to eq("{\n  \"./spec/test.log\": {\n    \"lines\": 10,\n    \"players\": [\n      \"Joao\",\n      \"JavaScript\"\n    ]\n  }\n}")
      end
    end
  end
end
