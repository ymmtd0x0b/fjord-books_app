# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @me = users(:me)
    @she = users(:she)
  end

  test '#na@me_or_email' do
    foo = users(:foo)
    assert_equal 'foo@example.com', foo.name_or_email

    foo_bar = users(:foo_bar)
    assert_equal 'Foo Bar', foo_bar.name_or_email
  end

  test '#following?' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#followed_by?' do
    assert_not @me.followed_by?(@she)
    @she.follow(@me)
    assert @me.followed_by?(@she)
  end

  test '#follow' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#unfollow' do
    @me.follow(@she)
    assert @me.following?(@she)
    @me.unfollow(@she)
    assert_not @me.following?(@she)
  end
end
