class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
