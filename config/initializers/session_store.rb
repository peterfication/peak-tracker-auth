require "redis-activesupport"
require "redis-actionpack"

if ENV.fetch("REDIS_URL", nil).present?
  PeakTrackerAuth::Application.config.session_store(
    :redis_store,
    servers: ["#{ENV.fetch("REDIS_URL")}/0/sessions"],
    key: "_peak_tracker_auth_session",
    secure: Rails.env.production?,
  )
else
  require "mock_redis"

  PeakTrackerAuth::Application.config.session_store(
    :redis_store,
    servers: ["redis://localhost:6379/0/sessions"],
    key: "_peak_tracker_auth_session",
    secure: false,
  )
end
