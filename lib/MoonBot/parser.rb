module MoonBot
  class Parser
    def self.parse data
      message = {}
      # if not empty
      if !data.scan(/^:/).empty?
        separated = data.split ':'
        body  = separated[1].split ' '
        message[:prefix]  = body.shift
        message[:command] = body.shift
        message[:params]  = body.shift
        return message
      else
        body = data.split ' '
        message[:command] = body.shift
        message[:args]    = body
        return message
      end
    end
    
  end
end