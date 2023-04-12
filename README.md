# README

## Dependencies: 

This rails app was generated using RoRo.

1. Docker version 23.0.3, build 3e7cbfd
2. docker-compose version 1.29.2, build 5becea4c

## Install:

### Decrypt environment variables using RoRo:

1. Normally encryption keys would be shared via a usb stick or similar. For the purposes of this exercise, however, I've generated sample keys:

``` 
cp mise/keys/base.key.exercise mise/keys/base.key
cp mise/keys/ci.key.exercise mise/keys/ci.key
cp mise/keys/development.key.exercise mise/keys/development.key
cp mise/keys/production.key.exercise mise/keys/production.key
cp mise/keys/staging.key.exercise mise/keys/staging.key
cp mise/keys/test.key.exercise mise/keys/test.key
```

2. Use RoRo to decrypt your environment variables:

```
docker-compose run --rm roro roro generate:exposed
```

3. Start the docker compose dev service, which starts the rails server:

```
docker-compose up --build dev
```
I like to leave this terminal running, and execute commands in the same container using a different shell.

2. Open a shell into the dev container: 

``` 
docker-compose exec dev sh
```

2. From inside the dev container, ingest the returns:
``` 
rake db:ingest:returns
```

3. Run the dev server:
```
yarn build --watch 
```