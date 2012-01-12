module MoonBot::Plugin
  class Auth
    def initialize bot
      @bot = bot
    end
    
    def on_notice message
      send_auth if message[:trailing] == '*** No Ident response'
    end
    
    def set_user nick, login, name = nil
      @nick  = nick
      @login = login
      @name  = name || login
    end
    
    def send_auth
      puts "Sending User Data"
      auth  = "NICK #{@nick}\r\n"
      auth += "USER #{@login} 8 * : #{@name}\r\n"
      @bot.client.send_data auth
    end
  end
end
