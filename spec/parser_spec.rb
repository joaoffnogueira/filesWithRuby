require_relative "../lib/parser"

RSpec.describe "#initialize" do
  
  context "if file not found" do
    it "raises exception" do
      path = "./not_found.log"
      expect "File not found"
    end
  end
  
  context "file exists" do
    it "so open the file" do
      file = File.open("./spec/test.log", 'r')
      expect File.exists?(file)
    end
  end
  
end

RSpec.describe "#print_first_line" do

  context "log is games.log" do
    it "and parser prints its first line" do
      file = File.open("./spec/test.log", 'r')
      parser = Parser.new(file)
      parser.print_first_line
      expect "first line of test.log"
    end
  end

end
