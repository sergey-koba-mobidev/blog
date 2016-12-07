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
require 'hanami/helpers'
require './router'

def fake_load(filename)
  eval(File.read(filename))
end

# Load lib
Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each {|file| require file }

fake_load 'config/better_errors.rb'
fake_load 'config/db.rb'
fake_load 'config/trailblazer.rb'

# Load controllers
Dir[File.join(File.dirname(__FILE__), 'app/controllers', '**', '*.rb')].each {|file| require file }

# If there is a database connection, run all the migrations
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), 'migrations'))
end

# Run rack app
run Router.app