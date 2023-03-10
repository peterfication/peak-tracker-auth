class AddSlugToOauthApplications < ActiveRecord::Migration[7.0]
  def change
    add_column(
      :oauth_applications,
      :slug,
      :string,
      null: false,
      unique: true,
      default: -> { "gen_random_uuid()" },
    )
  end
end
