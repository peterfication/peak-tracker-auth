# List all commands
default:
  just --list

# Start the Rails console
console:
  bundle exec rails console

# Run all steps from CI
ci: format lint test

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

# Start the Rails server
start:
  bundle exec rails server

# Run the tests
test:
  bundle exec rails test
