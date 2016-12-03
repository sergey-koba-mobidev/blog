require 'yaml'
require 'sequel'
require 'reform'
require 'reform/form/dry'
require 'trailblazer-loader'
require 'pry'
require './router'

# Init Db
db_config_file = File.join(File.dirname(__FILE__), "database.yml")
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
end

# Use dry validations
Reform::Contract.class_eval { feature Reform::Form::Dry }
Reform::Form.class_eval { feature Reform::Form::Dry }

# Load concepts
Trailblazer::Loader.new.(concepts_root: 'app/concepts/') do |file|
  require_relative(file)
end

# Load controllers
Dir[File.join(File.dirname(__FILE__), 'app/controllers', '**', '*.rb')].each {|file| require file }

# If there is a database connection, running all the migrations
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), 'migrations'))
end

# Run rack app
run Router.new.app