# One developer blog

A Blog completely built without rails

- install Docker and DockerCompose
- create alias in .bashrc `alias dcg="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"`
- run in root `dcg build`, then `./bin/setup.sh`
- run `dcg run admin ./cli seed_admin pass` to create user `skoba` with pass `pass`
- run app `dcg up -d`
- go to `localhost:4001`
- stop app `dcg stop`
- restart admin app `dcg restart admin`. In develop app is auto-restarted on any code change via `rerun` gem

## Console
- run `dvg run admin rack-console`

## Routes
- all routes `dcg run admin ./cli routes`, see [Hanami routes](https://github.com/hanami/router)

## DB Migrations
- migrate to `dcg run admin ./cli db_migrate [VERSION]`, see: [Sequel migrations](http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html)
- rollback to - just run `dcg run admin ./cli db_migrate [VERSION]` with VERSION you want to rollback to 

## Cli
- see commands list `dcg run admin ./cli help`

## TODO:
- Nginx proxy container
- Post detailed page
- Share plugin
- Tests
- only active posts and order by date
- Tags
- Search by tag
- Domain name
- Docker deploy