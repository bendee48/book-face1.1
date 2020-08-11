class FriendshipValidator < ActiveModel::Validator 
  def validate(record)
    if (record.class.where('friend_id = ? AND friend_of_id = ?', record.friend_of, record.friend).exists? &&
        record.class.where('friend_id = ? AND friend_of_id = ?', record.friend, record.friend_of).exists?)
          record.errors[:friendship] << "Friendship already exists!"
    end
  end
end