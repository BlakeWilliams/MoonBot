module MoonBot
  class Parser
    def self.parse data
      message = {}
      # if not empty
      if !data.scan(/^:/).empty?
        separated = data.split ':'
        body  = separated.last.split ' '
        message[:prefix]  = body.shift
        message[:command] = body.shift
        message[:params]  = body.shift
        2.times { separated.shift }
        message[:trailing] = separated.join(":")
      else
        body = data.split ' '
        message[:command] = body.shift
        message[:args]    = body
      end
      message
    end
    
  end
end