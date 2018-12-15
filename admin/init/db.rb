require 'yaml'
require 'sequel'

# Init Db
db_config_file = File.join(File.dirname(__FILE__), 'config', 'database.yml')
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  # Override db config with env vars
  config["host"] = ENV['POSTGRES_HOST'] unless ENV['POSTGRES_HOST'] == nil
  config["database"] = ENV['POSTGRES_DB'] unless ENV['POSTGRES_DB'] == nil
  config["user"] = ENV['POSTGRES_USER'] unless ENV['POSTGRES_USER'] == nil
  config["password"] = ENV['POSTGRES_PASSWORD'] unless ENV['POSTGRES_PASSWORD'] == nil
  DB = Sequel.connect(config)
  Sequel.extension :migration
  Sequel.extension :pagination
  Sequel::Model.db.extension(:pagination)
  require 'will_paginate/sequel'
end