class CreateDoorkeeperOpenidConnectTables < ActiveRecord::Migration[7.0]
  def change
    create_table :oauth_openid_requests, id: :uuid do |t|
      t.references :access_grant, null: false, index: true, type: :uuid
      t.string :nonce, null: false

      t.timestamps null: false, default: -> { "NOW()" }
    end

    add_foreign_key(
      :oauth_openid_requests,
      :oauth_access_grants,
      column: :access_grant_id,
      on_delete: :cascade,
      type: :uuid,
    )
  end
end
