require_relative "../parser"

RSpec.describe "#initialize" do
  
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
  
end

RSpec.describe "#print_first_line" do

  context "log is games.log" do
    it "and parser prints its first line" do
      file = File.open("./games.log", 'r')
      parser = Parser.new(file)
      parser.print_first_line
      expect "0:00 ------------------------------------------------------------"
    end
  end

end

RSpec.describe "#close" do

  context "parser is done" do
    it "closes de file" do
      @file = File.open("./games.log", 'r')
      @file.close
      @file
      expect nil
    end
  end
 
end
