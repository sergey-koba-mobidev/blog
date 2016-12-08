require './loaders'

fake_load 'app.rb'
fake_load 'init/migrations.rb'

# Run rack app
run Router.app