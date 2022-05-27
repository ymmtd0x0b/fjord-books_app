# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @follows, @method_type, @follow_or_unfollow =
      if current_user.following?(@user)
        [current_user.active_follows.find_by(followed_id: @user.id), :delete, t('views.common.unfollow')]
      else
        [current_user.active_follows.build, :post, t('views.common.follow')]
      end
  end

  def followings
    @title = t('views.follow.followings')
    @users = User.find(params[:id]).followings.with_attached_avatar.order(:id).page(params[:page])
    render 'followings_and_followers_list'
  end

  def followers
    @title = t('views.follow.followers')
    @users = User.find(params[:id]).followers.with_attached_avatar.order(:id).page(params[:page])
    render 'followings_and_followers_list'
  end
end
