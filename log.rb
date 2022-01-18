class Log
    def initialize(file)
        @file = file
        raise "File not found" unless File.exists?(@file)
    end
end