Rails.logger = Logger.new($stdout)

def log(message)
  Rails.logger.info message
end

log ""
log "Seeding database..."

log ""
log "> Seeding Doorkeeper applications..."
if Doorkeeper::Application.count.zero?
  log "> There is no Doorkeeper application yet. Seeding..."
  [
    {
      name: "Peak Tracker Web",
      slug: "peak-tracker-web",
      redirect_uri: "http://localhost:4000/auth/user/peak_tracker_auth/callback",
      scopes: "openid email",
      confidential: true,
      uid: "local-abc-123",
      secret: "local-secret-abc-123",
    },
    {
      name: "Peak Tracker App",
      slug: "peak-tracker-app",
      redirect_uri: "com.peak-tracker.auth://callback",
      scopes: "openid email",
      confidential: false,
      uid: "local-abc-123-app",
      secret: "local-secret-abc-123-app",
    },
  ].each do |attrs|
    log "--> Seeding Doorkeeper application with slug #{attrs[:slug]}"
    Doorkeeper::Application.find_or_initialize_by(slug: attrs[:slug]).update!(attrs)
    log "--> Doorkeeper application with slug #{attrs[:slug]} seeded."
  end
  log "> Doorkeeper applications seeded."
else
  log "> There is at least one Doorkeeper application already. Skip seeding"
end
log ""

log ""
if User.count.zero?
  log "> There are no Users yet. Seeding..."
  [
    {
      email: "mail@example.com",
      password: "example123",
      password_confirmation: "example123",
      confirmed_at: Time.zone.now,
    },
    {
      email: "admin@example.com",
      password: "example123",
      password_confirmation: "example123",
      confirmed_at: Time.zone.now,
      admin: true,
    },
  ].each do |attrs|
    log "--> Seeding user with email #{attrs[:email]}"
    User.find_or_initialize_by(email: attrs[:email]).update!(attrs)
    log "--> User with email #{attrs[:slug]} seeded."
  end
  log "> Users seeded."
else
  log "> There is at least one user already. Skip seeding users..."
end
log ""

log "Database seeded."
