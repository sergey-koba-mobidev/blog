require 'hanami/controller'
require 'hanami/helpers'
require './config/router'

require_dir 'lib'
fake_load 'config/better_errors.rb'
fake_load 'config/db.rb'
fake_load 'config/trailblazer.rb'
require_dir 'app/controllers'