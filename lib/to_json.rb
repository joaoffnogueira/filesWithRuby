require 'json'

class ToJSON

  def initialize(path, lines)
    @path = path
    @lines = lines
  end

  def to_json
    json = {
      @path => {
        "lines" => @lines
      } 
    }
    puts JSON.pretty_generate(json)
  end

end