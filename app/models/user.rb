# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :photos, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :friend_requests, dependent: :delete_all

  def friends
    FriendRequest.accepted.from_user(self)
  end

  def already_friends?(user)
    self.friends.where(friend: user)
  end
end
