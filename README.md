# README

## Dependencies: 

1. Docker version 23.0.3, build 3e7cbfd
2. docker-compose version 1.29.2, build 5becea4c

## Install:

1. Start the docker compose dev service, which starts the rails server:

```
docker-compose up --build dev
```
I like to leave this terminal running and then complete the following steps in a different terminal.

2. Ingest the returns:

``` 
docker-compose exec dev bundle exec rake db:ingest:returns
```

3. Open a shell to the dev container:
```
docker-compose exec dev sh
```

4. From inside the dev container shell:
```
yarn build --watch 
```