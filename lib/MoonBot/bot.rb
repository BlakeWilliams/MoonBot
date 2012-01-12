module MoonBot
  class Bot
    attr_reader :host, :port, :plugins, :client
    
    def initialize host, port
      @host = host
      @port = port
      
      @plugins = {}
    end
    
    def start
      EventMachine.run do
        @client = EventMachine.connect @host, @port, Client, Proc.new { |m| self.handle m }
      end
    end
    
    def handle message
      puts message
    end
  
  end
end