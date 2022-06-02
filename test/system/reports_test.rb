# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_1)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  # test 'creating a Report' do
  #   visit reports_url
  #   click_on 'New Report'

  #   fill_in 'Memo', with: @report.memo
  #   fill_in 'Title', with: @report.title
  #   click_on 'Create Report'

  #   assert_text 'Report was successfully created'
  #   click_on 'Back'
  # end

  # test 'updating a Report' do
  #   visit reports_url
  #   click_on 'Edit', match: :first

  #   fill_in 'Memo', with: @report.memo
  #   fill_in 'Title', with: @report.title
  #   click_on 'Update Report'

  #   assert_text 'Report was successfully updated'
  #   click_on 'Back'
  # end

  # test 'destroying a Report' do
  #   visit reports_url
  #   page.accept_confirm do
  #     click_on 'Destroy', match: :first
  #   end

  #   assert_text 'Report was successfully destroyed'
  # end
end
