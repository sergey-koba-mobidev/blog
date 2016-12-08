require 'yaml'
require 'sequel'

# Init Db
db_config_file = File.join(File.dirname(__FILE__), "database.yml")
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
  Sequel.extension :pagination
  Sequel::Model.db.extension(:pagination)
  require 'will_paginate/sequel'
end