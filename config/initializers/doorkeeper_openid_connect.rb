# frozen_string_literal: true

Doorkeeper::OpenidConnect.configure do
  issuer do |_resource_owner, _application|
    Rails.application.credentials.doorkeeper&.openid_connect&.issuer
  end

  signing_key Rails.application.credentials.doorkeeper&.openid_connect&.signing_key

  subject_types_supported [:public]

  resource_owner_from_access_token do |access_token|
    User.find_by(id: access_token.resource_owner_id)
  end

  auth_time_from_resource_owner(&:current_sign_in_at)

  reauthenticate_resource_owner do |resource_owner, return_to|
    store_location_for resource_owner, return_to
    sign_out resource_owner
    redirect_to new_user_session_url
  end

  # Depending on your configuration, a DoubleRenderError could be raised
  # if render/redirect_to is called at some point before this callback is executed.
  # To avoid the DoubleRenderError, you could add these two lines at the beginning
  #  of this callback: (Reference: https://github.com/rails/rails/issues/25106)
  #   self.response_body = nil
  #   @_response_body = nil
  select_account_for_resource_owner do |resource_owner, return_to|
    # Example implementation:
    # store_location_for resource_owner, return_to
    # redirect_to account_select_url
    #
    # This is not needed for now as a person probably only has one user for Peak Tracker.
  end

  subject do |resource_owner, application|
    Digest::SHA256.hexdigest(
      [
        resource_owner.id,
        application.id,
        Rails.application.credentials.doorkeeper&.openid_connect&.salt,
      ].join(":"),
    )
  end

  # Protocol to use when generating URIs for the discovery endpoint,
  protocol { Rails.env.production? ? :https : :http }

  # Expiration time on or after which the ID Token MUST NOT be accepted for processing. (default 120 seconds).
  # expiration 600

  claims do
    normal_claim :email do |resource_owner|
      resource_owner.email
    end
  end
end
