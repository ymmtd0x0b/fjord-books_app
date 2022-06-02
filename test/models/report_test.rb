# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @report = reports(:report_1)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#created_on' do
    assert_not_equal DateTime.now.next_year.to_date, @report.created_on
    assert_equal DateTime.now.to_date, @report.created_on
  end

  test '#editable?' do
    assert_not @report.editable?(@bob)
    assert @report.editable?(@alice)
  end
end
