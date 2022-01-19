require_relative "../lib/parser"
require_relative "../lib/to_json"

RSpec.describe "#to_json" do

  context "log is test.log" do
    it "and ToJSON puts a json object" do
      file = File.open("./spec/test.log", 'r')
      parser = Parser.new(file)
      lines = parser.count_lines
      full_path = File.expand_path(file)
      print = ToJSON.new(full_path, lines)
      expect(print.to_json).to eq("{\n  \"#{full_path}\": {\n    \"lines\": 10\n  }\n}")
    end
  end

end
