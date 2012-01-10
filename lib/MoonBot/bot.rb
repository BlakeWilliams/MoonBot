module MoonBot
  class Bot
    attr_reader :host, :port, :plugins
    
    def initialize host, port
      @host = host
      @port = port
      
      @plugins = {}
    end
    
    def start
      EventMachine.run do
        EventMachine.connect @host, @port, Client, Proc.new { |x| puts x }
      end
    end
  
  end
end