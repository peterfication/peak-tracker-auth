require "redis-activesupport"
require "redis-actionpack"

if ENV.fetch("REDIS_URL", nil).present?
  PeakTrackerAuth::Application.config.session_store(
    :redis_store,
    servers: ["#{ENV.fetch("REDIS_URL")}/3/sessions"],
    key: "_peak_tracker_auth_session",
  )
end
