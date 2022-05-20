# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # フォロー用アソシエーション
  has_many :active_follows, foreign_key: 'follower_id',
                            class_name: 'Follow',
                            inverse_of: 'follower',
                            dependent: :destroy
  has_many :passive_follows, foreign_key: 'followed_id',
                             class_name: 'Follow',
                             inverse_of: 'followed',
                             dependent: :destroy
  has_many :followings, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    followings << other_user
  end

  # ユーザーフォローを解除する
  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    followings.include?(other_user)
  end
end
