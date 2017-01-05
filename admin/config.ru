require './loaders'

fake_load 'app.rb'

# Run rack app
run Router.app