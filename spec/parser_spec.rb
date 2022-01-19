require_relative "../lib/parser"

RSpec.describe "#initialize" do
  
  context "if file not found" do
    it "raises exception" do
      path = "./not_found.log"
      expect { raise "File not found" }.to raise_error(RuntimeError, "File not found")
    end
  end
  
  context "file exists" do
    it "so open the file" do
      file = File.open("./spec/test.log", 'r')
      expect(File.exists?(file)).to be true
    end
  end
  
end

RSpec.describe "#print_first_line" do

  context "log is test.log" do
    it "and parser prints its first line" do
      file = File.open("./spec/test.log", 'r')
      parser = Parser.new(file)
      expect(parser.print_first_line).to eq("first line of test.log\r\n")
    end
  end

end

RSpec.describe "#count_lines" do

  context "log is test.log" do
    it "and parser counts its lines" do
      file = File.open("./spec/test.log", 'r')
      parser = Parser.new(file)
      expect(parser.count_lines).to eq(10)
    end
  end

end
