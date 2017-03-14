# One developer blog

This is a small personal blog web application, built using Rack and standalone gems.
The idea is to show how a completely feature full MVC application can be created without using any framework. 
The blog is divided into 2 separate applications: `front` and `admin`.
Also it uses Docker both for local development and production ([using Rancher](http://1devblog.org/en/article/docker-in-production-using-rancher)).
You can find a working demo here: [http://1devblog.org/en](http://1devblog.org/en)

## Installation
- install Docker and DockerCompose
- create alias in .bashrc `alias dcg="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"`
- run in root `dcg build`, then `./bin/setup.sh`
- run `dcg run admin ./cli seed_admin pass` to create user `skoba` with pass `pass`
- run app `dcg up -d`
- go to [http://localhost:3001](http://localhost:3001) for Front and [http://localhost:3000](http://localhost:3000) for Admin 
- stop app `dcg stop`
- restart admin app `dcg restart admin`. In local env apps are auto-restarted on any code change via `rerun` gem

## Interactive Console
- run `dcg run admin rack-console`

## Routes
- print all routes `dcg run admin bundle exec ./cli routes`, see [Hanami routes](https://github.com/hanami/router)
- edit application routes in `init/router.rb`

## DB Migrations
- migrate to `dcg run admin bundle exec ./cli db_migrate [VERSION]`, see: [Sequel migrations](http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html)
- rollback to - just run `dcg run admin bundle exec ./cli db_migrate [VERSION]` with VERSION you want to rollback to
- edit db credentials in `config/database.yml`

## Cli (rake analogue)
- see commands list `dcg run admin bundle exec ./cli help`

## TODO features:
- sidebar posts and tags
- Tests
- automate deploys
- subscribe for email notifications
