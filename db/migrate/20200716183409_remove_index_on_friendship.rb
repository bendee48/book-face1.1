class RemoveIndexOnFriendship < ActiveRecord::Migration[6.0]
  def change
    remove_index :friendships, name: "index_friendships_on_friend_id"
    remove_index :friendships, name: "index_friendships_on_friend_of_id"
  end
end
