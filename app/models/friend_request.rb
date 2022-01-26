class FriendRequest < ApplicationRecord
  validates :user_id, :friend_id, presence: true
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
  belongs_to :user

  PENDING = 0
  ACCEPTED = 1
  DECLINED = 2
end
