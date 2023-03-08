##
# Helpers for request specs.
module RequestHelpers
  def sign_in(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
    follow_redirect!
  end
end

RSpec.configure { |config| config.include RequestHelpers, type: :request }
