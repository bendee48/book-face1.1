class AddUniqueIndexToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, [:friend_id, :friend_of_id], unique: true
  end
end
