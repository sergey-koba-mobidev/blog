# blog

- install Docker and DockerCompose
- create alias in .bashrc `alias dcg="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"`
- run in root `dcg build`, `./bin/setup.sh`
- run app `dcg up -d`
- go to `localhost:3000`
- stop app `dcg stop`
- restart admin app `dcg restart admin`. In develop app is auto-restarted on any code change via `rerun` gem

## Console
- run `dvg run admin rack-console`

## Routes
- to list all routes type in console `Router.print_routes`