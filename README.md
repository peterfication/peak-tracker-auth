# Peak Tracker Auth

<p>
  <a href="https://github.com/peterfication/peak-tracker-auth/actions?query=branch%3Amain+">
    <img alt="CI" src="https://github.com/peterfication/peak-tracker-auth/actions/workflows/ci.yml/badge.svg" \>
  </a>
  <a href="https://codecov.io/gh/peterfication/peak-tracker-auth">
    <img alt="CodeCov" src="https://codecov.io/gh/peterfication/peak-tracker-auth/branch/main/graph/badge.svg?token=V5HKH4C2BA" \>
  </a>
  <a href="https://sonarcloud.io/summary/new_code?id=peterfication_peak-tracker-auth">
    <img alt="Maintainability Rating" src="https://sonarcloud.io/api/project_badges/measure?project=peterfication_peak-tracker-auth&metric=sqale_rating" \>
  </a>
  <a href="https://codeclimate.com/github/peterfication/peak-tracker-auth/maintainability">
    <img src="https://api.codeclimate.com/v1/badges/9bbbb69ec0e5f8789e82/maintainability" />
  </a>
</p>

Identity provider for [Peak Tracker](https://github.com/peterfication/peak_tracker_backend)

It's built with [Ruby on Rails](https://rubyonrails.org/), [Devise](https://github.com/heartcombo/devise) and [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper).

## Useful commands

Commands are defined in the [`Justfile`](Justfile) and can be listed with [`just`](https://github.com/casey/just).

## Getting started

Peak Tracker Auth expects a PostgreSQL database and a Redis server to be accessible.

```console
# Make sure you have the required Ruby version installed
ruby -v
-> ruby 3.2.2 ...

# Install the dependencies
bundle

# Setup the database
bundle exec rails db:setup

# Start the server
just start
```

## Troubleshooting

### Installing `puma` fails

```
...
compiling http11_parser.c
compiling mini_ssl.c
compiling puma_http11.c
linking shared-object puma/puma_http11.bundle
Undefined symbols for architecture arm64:
  "_SSL_get1_peer_certificate", referenced from:
      _engine_peercert in mini_ssl.o
ld: symbol(s) not found for architecture arm64
...
```

See this [PR comment](https://github.com/puma/puma/issues/2790#issuecomment-1547332463)
