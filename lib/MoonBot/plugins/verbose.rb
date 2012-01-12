module MoonBot::Plugin
  class Verbose
    def initialize bot
    end
    
    def any message
      puts message
    end
  end
end