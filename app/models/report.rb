# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def creater
    user.name.empty? ? user.email : user.name
  end
end
