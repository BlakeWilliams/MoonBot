module MoonBot
  class Parser
    def self.parse data
      message = {}
      # if not empty
      if data.scan(/^:/).empty?
        body = data.split ' '
        message[:command] = body.shift
        message[:args]    = body
      else
        separated = data.split ':'
        body  = separated[1].split ' '
        message[:prefix]  = body.shift
        message[:command] = body.shift
        message[:params]  = body.shift
        2.times { separated.shift }
        message[:trailing] = separated.join(":")
      end
      message
    rescue
      nil
    end
    
  end
end
