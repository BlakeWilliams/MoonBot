module MoonBot::Plugin
  attr_reader :nick, :login, :name

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
      nick = "NICK #{@nick}"
      user = "USER #{@login} 8 * : #{@name}"
      @bot.command nick
      @bot.command user
    end
  end
end
