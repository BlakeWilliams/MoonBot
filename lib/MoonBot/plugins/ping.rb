module MoonBot::Plugin
  class Ping
    def initialize bot
      @bot = bot
    end
    
    def on_ping message
      pong = "PONG #{message[:args]}"
      @bot.command pong
    end
  end
end
