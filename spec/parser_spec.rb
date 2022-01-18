require_relative "../parser"

RSpec.describe Parser do
    context "log is games.log" do
      it "and parser prints its first line" do
        file = File.open("./games.log", 'r')
        parser = Parser.new(file)
        parser.print_first_line
        expect "0:00 ------------------------------------------------------------"
      end
    end
end
