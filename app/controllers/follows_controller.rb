# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_user, only: %i[create destroy]

  def create
    current_user.follow(@user) unless current_user.active_follows.pluck(:followed_id).include?(@user.id)
    redirect_to @user
  end

  def destroy
    current_user.unfollow(@user) if current_user.active_follows.pluck(:id).include?(params[:id].to_i)
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
