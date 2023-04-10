class AddAdminNotNullToUsers < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { change_column :users, :admin, :boolean, null: false, default: false }

      dir.down { column_column :users, :admin, :boolean, null: true, default: false }
    end
  end
end
