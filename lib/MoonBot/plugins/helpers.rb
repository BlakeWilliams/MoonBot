module MoonBot::Helpers
  def parse_user user_string
    user = {} 
    nick, host = user_string.split('@')
    nick, name = nick.split('!')
    user[:nick] = nick
    user[:name] = name
    user[:host] = host
    user
  end

  def match msg, regex
    if msg[:trailing].scan(regex)
      args = msg[:trailing].gsub(regex, '')
      yield args
    end
  end

end
