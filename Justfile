# List all commands
default:
  just --list

# Start the Rails console
console:
  bundle exec rails console

# Run all steps from CI
ci: spellcheck format lint db-doctor test

# Edit the Rails credentials
credentials-edit:
  rails credentials:edit

# Get a base64 version of the encrypted credentials for CI
credentials-base64:
  cat config/credentials.yml.enc | base64 | pbcopy

# Set the current credentials.yml.enc as a base64 encoded secret in Github Actions
credentials-gh-set:
  cat config/credentials.yml.enc | base64 | xargs gh secret set CREDENTIALS_BASE64 --body

# Create and migrate the development database
db-setup:
  bundle exec rails db:setup

# Reset the development database
db-reset:
  bundle exec rails db:reset

# Run ActiveRecord Doctor
db-doctor:
  bundle exec rake active_record_doctor

# Format the files with Prettier
format:
  bundle exec rbprettier --write '**/*.{rb,yml,json,js,md,graphql,haml}'

# Lint the Ruby files with Rubocop and HAML lint
lint: lint-rubocop lint-haml

# Lint the Ruby files with HAML lint
lint-haml:
  bundle exec haml-lint app/**/*.haml

# Lint the Ruby files with Rubocop
lint-rubocop:
  bundle exec rubocop

message-bus-publish:
  find app config lib -type f -name "*.rb" -exec grep -Hn "MessageBus.publish" {} \;

message-bus-publish-event-names-only:
  find app config lib -type f -name "*.rb" -exec grep -oP '(?<=MessageBus\.publish ")[^"]*|(?<=MessageBus\.publish\(")[^"]*' {} \;

message-bus-subscribe:
  find app config lib -type f -name "*.rb" -exec grep -Hn "MessageBus.subscribe" {} \;

message-bus-subscribe-event-names-only:
  find app config lib -type f -name "*.rb" -exec grep -oP '(?<=MessageBus\.subscribe ")[^"]*|(?<=MessageBus\.subscribe\(")[^"]*' {} \;

message-bus-check:
  scripts/message_bus_check.sh

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
