# Dev
if ENV['RACK_ENV'] == 'development'
  require 'pry'
  require 'better_errors'

  Hanami::Controller.configure { handle_exceptions false } # let better_errors to handle them

  use BetterErrors::Middleware
  BetterErrors::Middleware.allow_ip! '0.0.0.0/0'
  BetterErrors.application_root = File.dirname(__FILE__)
end