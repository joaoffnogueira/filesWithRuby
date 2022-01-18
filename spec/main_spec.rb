require_relative "../main"

RSpec.describe "main function" do
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
