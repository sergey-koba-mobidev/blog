require './loaders'

fake_load 'app.rb'
fake_load 'config/migrations.rb'

# Run rack app
run Router.app