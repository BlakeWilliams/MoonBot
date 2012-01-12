# Require all files from plugins directory
Dir[File.join(File.dirname(__FILE__), 'plugins', '*.rb')].map {|f| require f }