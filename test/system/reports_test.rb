# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '日報２'
    fill_in '内容', with: '新規作成のシステムテスト'
    click_on '登録する'

    assert_text '日報が作成されました。'
  end

  test 'updating a Report' do
    visit reports_url
    find(:xpath, '/html[1]/body[1]/table[1]/tbody[1]/tr[1]/td[5]/a[1]').click

    fill_in 'タイトル', with: '日報_編集', fill_options: { clear: :backspace }
    fill_in '内容', with: '編集のシステムテスト', fill_options: { clear: :backspace }
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text '日報_編集'
    assert_text '編集のシステムテスト'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      find(:xpath, '/html[1]/body[1]/table[1]/tbody[1]/tr[1]/td[6]').click
    end

    assert_text '日報が削除されました。'
    assert_no_text '日報１'
  end
end
