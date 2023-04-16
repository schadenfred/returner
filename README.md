# README

## Install:

### Dependencies: 

This rails app was initially generated using RoRo and these versions of docker and docker compose:

1. Docker version 23.0.3, build 3e7cbfd
2. docker-compose version 1.29.2, build 5becea4c


### Environment variables:

1. Copy the exercise keys:

``` 
cp mise/keys/base.exercise mise/keys/base.key
cp mise/keys/ci.exercise mise/keys/ci.key
cp mise/keys/development.exercise mise/keys/development.key
cp mise/keys/production.exercise mise/keys/production.key
cp mise/keys/staging.exercise mise/keys/staging.key
cp mise/keys/test.exercise mise/keys/test.key
```

2. Expose your environment variables:

```
docker-compose run --rm roro roro generate:exposed
```

3. Start the dev service:

```
docker-compose up --build dev
```

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