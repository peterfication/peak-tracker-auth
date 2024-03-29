source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

gem "lograge"
gem "message_bus"
gem "pg", "~> 1.5"
gem "puma", "~> 6.4"
gem "strong_migrations"
gem "wisper"

gem "fakeredis", require: false # This project is still in alpha mode, so it's ok to not need a proper Redis instance
gem "redis", "< 5" # > 5 is needed for redis-actionpack and redis-activesupport
gem "redis-actionpack"
gem "redis-activesupport"
gem "sidekiq"

gem "haml", "6.3.0"
gem "haml-rails", "~> 2.0" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "importmap-rails" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder"
gem "sprockets-rails" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "tailwindcss-rails" # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "devise"
gem "doorkeeper"
gem "doorkeeper-openid_connect"

gem "sparkpost_rails", github: "peterfication/sparkpost_rails", branch: "rails7"

gem "sentry-rails"
gem "sentry-ruby"

group :development, :test do
  gem "bullet"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 6.1.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "active_record_doctor"
  gem "annotate"
  gem "dockerfile-rails", ">= 1.2", require: false
  gem "foreman", require: false
  gem "haml_lint", require: false
  gem "prettier", require: false
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
  gem "solargraph", require: false
  gem "solargraph-rails", require: false

  # Command to convert all erb to haml files:
  # find . -name \*.html.erb -print | sed 'p;s/.html.erb$/.html.haml/' | xargs -n2 html2haml
  gem "html2haml", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "faker"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "webdrivers"
end
