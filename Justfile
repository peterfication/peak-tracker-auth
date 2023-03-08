# List all commands
default:
  just --list

# Start the Rails console
console:
  bundle exec rails console

# Run all steps from CI
ci: spellcheck format lint test

# Edit the Rails credentials
credentials-edit:
  rails credentials:edit

# Get a base64 version of the encrypted credentials for CI
credentials-base64:
  cat config/credentials.yml.enc | base64 | pbcopy

# Create and migrate the development database
db-setup:
  bundle exec rails db:setup

# Reset the development database
db-reset:
  bundle exec rails db:reset

# Format the files with Prettier
format:
  bundle exec rbprettier --write '**/*.{rb,yml,json,js,md,graphql}'

# Lint the Ruby files with Rubocop
lint:
  bundle exec rubocop

# Run the spellcheck
spellcheck:
  yarn spellcheck

# List words that are unknown to the spellchecker
spellcheck-list:
  yarn spellcheck:list

# Install the yard docs needed for Solargraph to work better
solargraph-setup:
  yard gems

# SSH into the container on fly.io
ssh:
  fly ssh console

# Open up a Rails console on fly.io
ssh-console:
  fly ssh console --command "rails/bin/rails console"

# Stream the logs from fly.io
ssh-logs:
  fly logs

# Proxy the PostgreSQL database via fly.io
ssh-proxy-db:
  fly proxy 5433:5432 -a peak-tracker-auth-db

# Connect to the Redis instance via fly.io
ssh-redis-proxy:
  fly redis connect

# Start the Rails server
start:
  # This bin script is needed for Tailwind
  bin/dev

# Run the tests
test:
  bundle exec rake factory_bot:lint
  bundle exec rspec
