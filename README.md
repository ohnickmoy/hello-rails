# Hello, Rails!

This is a basic Ruby on Rails App to display "Hello, Rails" on your local machine, along with a redis instance, a postgresql instance, and some basic monitoring via Prometheus and Grafana

## Prerequisites

This guides assumes you're running this on Mac OS X and a more recent version of docker (since there's a divergence between `docker-compose` and `docker compose`).

At minimum, you'll need docker on your machine to build and run the containers. Mac machines use Docker Desktop. 

## Building and Running Your Local Environment

Once you have that ready, run

```
docker compose build
```
then
```
docker compose up
```

The Makefile is there for your convenience to short hand some of these commands, e.g. `make build`, or `make up`

## Dev Flow

If you do fork this repo for your own purposes to learn, be sure to run `bundle install` every time you add a new gem to update the `Gemfile.lock` file before running `docker compose build`

## Alerting and Monitoring

Given time constraints, only some basic metrics for the Rails is supplied. 

## Troubleshooting

### Google Chrome is forcing SSL connections

It's possible that when you use Google Chrome, you'll get redirected to an error page. If you get something related to SSL, it's possible that Chrome is forcing ssl connections. 

You can either use another browser, clear your cache and do a hard reset, or go to `chrome://net-internals/#hsts` in the chrome browser, and delete the `localhost` domain security policy.  
