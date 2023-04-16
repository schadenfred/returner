# README

This is a rails 7 app meeting the requirements for a programming exercise designed to test a developer's ability to ingest data, build an api, and consume that api using some kind of frontend app.

The following instructions are intended to help an evaluator set up and run this app.

### Check your Docker and Docker Compose Dependencies: 

This rails app was generated using RoRo and these versions of Docker and Docker Compose:

1. Docker version 23.0.3, build 3e7cbfd
2. docker-compose version 1.29.2, build 5becea4c

### Clone the app:

```
git clone git@github.com:schadenfred/returner.git
```

### Expose necessary nvironment variables:

1. Copy the exercise keys like so:

``` 
cp mise/keys/base.exercise mise/keys/base.key
cp mise/keys/ci.exercise mise/keys/ci.key
cp mise/keys/development.exercise mise/keys/development.key
cp mise/keys/production.exercise mise/keys/production.key
cp mise/keys/staging.exercise mise/keys/staging.key
cp mise/keys/test.exercise mise/keys/test.key
```

2. Create an empty base.env file referenced the dev service in docker-compose.yml:

```
touch mise/env/base.env
```

2. Expose your environment variables:

```
docker-compose run --rm roro roro generate:exposed
```

### Start it up:

1. Run the dev service, which starts the rails server, in a container using Docker Compose:

```
docker-compose up --build dev
```

2. Open a shell into the running dev container: 

``` 
docker-compose exec dev sh
```

3. Migrate your database:

``` 
/app # rake db:migrate 
```

3. Migrate your database:

``` 
/app # rake db:ingest:returns
```

3. Run the front end dev server:
```
/app # yarn build --watch 
```

The app should be running at localhost:3000 