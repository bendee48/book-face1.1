class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :friend, index: true, foreign_key: {to_table: :users}
      t.references :friend_of, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
