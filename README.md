# Hello, Rails!

This is a basic Ruby on Rails App to display "Hello, Rails" on your local machine, along with a redis instance, a postgresql instance, and some basic monitoring via Prometheus and Grafana. It's meant for educational purposes and not for a production environment

## Prerequisites

This guides assumes you're running this on Mac OS X and a more recent version of docker (since there's a divergence between `docker-compose` and `docker compose`).

At minimum, you'll need docker on your machine to build and run the containers. Mac machines use Docker Desktop. 

## Building and Running Your Local Environment

Once you clone the repo and get yourself sorted out, run

```
docker compose build
```
then
```
docker compose up
```

The Makefile is there for your convenience to short hand some of these commands, e.g. `make build`, or `make up`

To access the rails app, go to `localhost:3000`

To access prometheus, go to `localhost:9090`

To access the Grafana service, go to `localhost:3001`, and type in for both the username and password and skip the creation of a new password 

## Dev Flow

If you do fork this repo for your own purposes to learn, be sure to run `bundle install` every time you add a new gem to update the `Gemfile.lock` file before running `docker compose build`

## Alerting and Monitoring

Each service has their own dashboard. Due to some time constraints, I've decided to settle down on some simple alerts but would to explore more in the future. 

### Rails 

Rails metrics are fairly simple as this point and they're provided by the `prometheus-client` gem. Out of the box are the following metrics:

- `http_server_requests_total`
- `http_server_request_duration_seconds_bucket`
- `http_server_request_duration_seconds_sum`
- `http_server_request_duration_seconds_count`

Metrics displayed on the dashboard include HTTP server requests, average request duration, and HTTP request rate.

Alerting covers a high 404 count over 3 minutes. Other alerts  I would've liked to cover would be High Memory / CPU usage, or latency. 

### Postgres

Postgres dashboard was adapted from [this source](https://grafana.com/grafana/dashboards/9628-postgresql-database/)

Alerting covers if there's a lost connection or if the database is not responsive over a minute. Other alerts to explore include query speed, or high disk usage

### Redis

Redis dashboard was adapted from [this source](https://grafana.com/grafana/dashboards/11692-redis-dashboard-for-prometheus-redis-exporter-1-x/)

Alerts cover high memory usage over 2 Gigs over 5 minutes and a high number of connected clients at once. Similar alerts to explore would probably include high CPU usage, or if connection to the redis server is lost. 

## Troubleshooting

### Google Chrome is forcing SSL connections

It's possible that when you use Google Chrome, you'll get redirected to an error page. If you get something related to SSL, it's possible that Chrome is forcing ssl connections. 

You can either use another browser, clear your cache and do a hard reset, or go to `chrome://net-internals/#hsts` in the chrome browser, and delete the `localhost` domain security policy.  
