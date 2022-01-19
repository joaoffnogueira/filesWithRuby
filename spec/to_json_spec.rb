require_relative "../lib/to_json"

RSpec.describe "#to_json" do

  context "providing full_path and lines" do
    it "ToJSON puts a json object" do

      full_path = "/home/jffn/filesWithRuby/spec/test.log"
      lines = 10
      print = ToJSON.new(full_path, lines)

      expect(print.to_json).to eq("{\n  \"#{full_path}\": {\n    \"lines\": 10\n  }\n}")
    end
  end

end
