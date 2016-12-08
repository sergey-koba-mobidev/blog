# blog

- install Docker and DockerCompose
- create alias in .bashrc `alias dcg="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"`
- run in root `dcg build`, `./bin/setup.sh`
- run app `dcg up -d`
- go to `localhost:4001`
- stop app `dcg stop`
- restart admin app `dcg restart admin`. In develop app is auto-restarted on any code change via `rerun` gem

## Console
- run `dvg run admin rack-console`

## Routes
- all routes `dcg run admin cli routes`, see [Hanami routes](https://github.com/hanami/router)

## DB Migrations
- migrate to `dcg run admin cli db_migrate [VERSION]`, see: [Sequel migrations](http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html)

## Cli
- see commands list `dcg run admin cli help`

## TODO:
- add authentication
- add webpack and bootstrap
- messages to user