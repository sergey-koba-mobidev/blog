# config.ru
require_relative 'my_blog'

require 'yaml'
require 'sequel'

# Init Db
db_config_file = File.join(File.dirname(__FILE__), 'config', 'database.yml')
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
end

# If there is a database connection, run all the migrations
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), 'migrations'))
end

# Load models
Dir[File.join(File.dirname(__FILE__), 'models', '**', '*.rb')].sort.each {|file| require file }

# Load controllers
Dir[File.join(File.dirname(__FILE__), 'controllers', '**', '*.rb')].sort.each {|file| require file }

run MyBlog.router