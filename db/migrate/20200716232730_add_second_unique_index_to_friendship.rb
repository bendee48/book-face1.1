class AddSecondUniqueIndexToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, [:friend_of_id, :friend_id], unique: true
  end
end
