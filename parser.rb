class Parser
    def initialize(log)
        @log = log
    end
    def print_first_line
        File.open(@log, "r") do |file|
            puts file.readline
        end
    end
end