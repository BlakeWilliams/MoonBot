module MoonBot
  class Client < EventMachine::Connection

    def initialize on_message
      @on_message = on_message
    end

    def receive_data(data)
      data = data.split "\r\n"
      data.each do |d|
        message = Parser::parse(d)
        @on_message.call(message) if @on_message
      end
    end

  end
end
