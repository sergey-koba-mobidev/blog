require 'yaml'
require 'sequel'

# Init Db
session_config_file = File.join(File.dirname(__FILE__), 'config', 'session.yml')
if File.exist?(session_config_file)
  config = YAML.load(File.read(session_config_file))
  use Rack::Session::Cookie, secret: config['secret']
end