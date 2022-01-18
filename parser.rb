class Parser
    def initialize(log)
        @log = log
    end
    def print_first_line
        puts @log.readline
    end
end