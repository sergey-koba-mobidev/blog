# One developer blog

This is a small personal blog web application, built using Rack and standalone gems.
The idea is to show how a completely feature full MVC application can be created without using any framework. 
It uses Docker both for local development.

## Installation
- install Docker and DockerCompose
- create alias in .bashrc `alias dcg="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"`
- run in root `dcg build`
- run app `dcg up -d`
- go to [http://localhost:3000](http://localhost:3000)
- stop app `dcg stop`

## Interactive Console
- run `dcg run web rack-console`