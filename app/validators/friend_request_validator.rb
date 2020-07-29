class FriendRequestValidator < ActiveModel::Validator 
  def validate(record)
    if (record.class.where('user_id = ? AND friend_id = ?', record.user_id, record.friend_id).exists? ||
        record.class.where('user_id = ? AND friend_id = ?', record.friend_id, record.user_id).exists?)
          record.errors[:friend_request] << "Friend Request already sent."
    end
  end
end