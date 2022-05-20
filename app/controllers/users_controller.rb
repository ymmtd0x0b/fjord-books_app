# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @title = :followings
    @users = User.find(params[:id]).followings.with_attached_avatar.order(:id).page(params[:page])
    render 'followings_and_followers_list'
  end

  def followers
    @title = :followers
    @users = User.find(params[:id]).followers.with_attached_avatar.order(:id).page(params[:page])
    render 'followings_and_followers_list'
  end
end
