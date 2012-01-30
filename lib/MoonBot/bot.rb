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
        @client = EventMachine.connect @host, @port, Client, Proc.new do |message| 
          message = message.split("\r\n")
          message.each do {|m| self.handle m}
        end
      end
    end
    
    def handle message
      return if message.nil?
      @plugins.each do |name, instance|
        instance.send('on_' + message[:command].downcase, message) rescue nil
        instance.send('any', message) if instance.respond_to? 'any'          
      end
    end
    
    def register plugin
      @plugins[plugin.to_s] = plugin.new(self)
      puts "Loading #{plugin.to_s}"
    end
    
    def command message
      self.client.send_data(message + '\r\n')
    end
  
  end
end
