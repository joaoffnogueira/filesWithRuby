class Parser

    def initialize(path)
        @path = path
        begin
            @file = File.open(path, 'r')
        rescue
            raise "File not found"
        end
    end

    def print_first_line
        puts @file.readline
    end
    
    def close
        @file.close
    end
    
end
