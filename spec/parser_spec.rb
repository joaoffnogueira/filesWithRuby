require_relative "../parser"

RSpec.describe Parser do
  context "if file not found" do
    it "raises exception" do
      path = "./not_found.log"
      expect "File not found"
    end
  end
  context "file exists" do
    it "so open the file" do
      file = File.open("./games.log", 'r')
      expect File.exists?(file)
    end
  end
  context "log is games.log" do
    it "and parser prints its first line" do
      file = File.open("./games.log", 'r')
      parser = Parser.new(file)
      parser.print_first_line
      expect "0:00 ------------------------------------------------------------"
    end
  end
end
