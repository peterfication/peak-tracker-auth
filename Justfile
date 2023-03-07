default:
  just --list

format:
  bundle exec rbprettier --write '**/*.{rb,yml,json,js,md,graphql}'

lint:
  bundle exec rubocop
