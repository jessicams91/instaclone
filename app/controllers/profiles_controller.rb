# frozen_string_literal: true

class ProfilesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @users = if params[:username]&.present?
               User.where(username: params[:username])
             else
               User.limit(20)
             end
  end

  def show
    @user = User.find_by! username: params[:username]
  end

  def add_friend
    FriendRequest.create(friend: params[:id], user: current_user, status: FriendRequest::PENDING)

    redirect_to profiles_url
  end
end
