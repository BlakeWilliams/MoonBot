# MoonBot: The stupid modular bot
MoonBot is my bot "framework" where the bot does nothing but connect to the server, not even play ping pong.

## What does it do?
Nothing with the exception of the default plugins that you can choose to use. To do anything with the bot you have to write a plugin that responds to the proper command. Right now the built in plugins are Ping, Auth, and Verbose.

## How do I write a plugin?
Plugins are incredibly simple, all you do is make a class, add an initializer that takes one parameter (bot), and then define methods that respond to the command the server sends. All methods are the command the server sends with "on_" prefixed. So if you want to check every PRIVMSG and respond accordingly you would define a method called "on_privmsg".

```ruby
class Ping
  def initialize bot
    @bot = bot
  end
    
  def on_ping message
    pong = "PONG #{message[:args]}"
    @bot.command pong
  end
end
```

The initializer takes the bot as a paramater so you can access the client to send data and also access plugins so you can call methods from them (for example you have an authorization plugin that you want to use on the user). There is also the "any" method, if your plugin has this method it will be called every time the server sends back data. To send data to the server call @bot.command, which will send the proper data to the server, including "\r\n".

## How do I get started?
First, Add moonbot to your Gemfile.

```ruby
source "http://rubygems.org"
gem 'moonbot'
```

Second, create a file and start hacking. Here is a simple bot to get you started. If you're making your own plugins in the same directory as your bot, I suggest making a plugins directory and putting them there because in the future MoonBot might have helper commands for loading plugins. Plugins as gems are also a nice decision if you want to share them easily.

```ruby
require 'moonbot'
require 'moonbot/plugin'

@bot = MoonBot::Bot.new 'irc.server.tld', 6667
@bot.register MoonBot::Plugin::Ping
@bot.register MoonBot::Plugin::Verbose
@bot.register MoonBot::Plugin::Auth
@bot.plugins["MoonBot::Plugin::Auth"].set_user "Nick", "Name"
@bot.start
```
    
## Why?
It was just a stupid idea that I wanted to play with and it turned out not being as stupid as I thought (but is still pretty dumb).

## License
Copyright (c) 2012 Blake Williams

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
