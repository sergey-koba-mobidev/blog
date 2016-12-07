require 'yaml'
require 'sequel'
require 'reform'
require 'reform/form/dry'
require 'trailblazer'
require 'trailblazer-loader'
require 'trailblazer/cell'
require 'cell/erb'
require 'formular'
require 'trailblazer/operation/model'
require 'trailblazer/operation/controller'
require 'hanami/controller'
require './router'

Formular::Helper.builder= :bootstrap3

# Dev
if ENV['RACK_ENV'] == 'development'
  require 'pry'
  require 'better_errors'

  Hanami::Controller.configure { handle_exceptions false } # let better_errors to handle them

  use BetterErrors::Middleware
  BetterErrors::Middleware.allow_ip! '0.0.0.0/0'
  BetterErrors.application_root = File.dirname(__FILE__)
end

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
run Router.app