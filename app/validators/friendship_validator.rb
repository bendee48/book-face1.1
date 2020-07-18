class FriendshipValidator < ActiveModel::Validator 
  def validate(record)
    if record.class.where('friend_id = ? AND friend_of_id = ?', record.friend_of, record.friend).exists?
      record.errors[:friendship] << "Already friends!"
    end
  end
end