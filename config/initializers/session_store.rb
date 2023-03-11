if ENV.fetch("REDIS_URL", nil).present?
  PeakTrackerAuth::Application.config.session_store(
    :redis_store,
    servers: "#{ENV.fetch("REDIS_URL")}/3/session",
  )
end
