# frozen_string_literal: true

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp == 'Y'
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

50.times do
  Book.create!(
    title: Faker::Book.title,
    memo: Faker::Book.genre,
    author: Faker::Book.author,
    picture: picture_file('no-image.png')
  )
end

# ユーザーデータ
User.destroy_all

User.create!(
  name: 'Ruby太郎',
  email: 'ruby@sample.jp',
  self_introduction: 'Ruby太郎です！！！',
  postal_code: '163-8001',
  prefecture: '東京都',
  city: '新宿区西新宿',
  street: '２−８−１',
  building: '東京都庁ビル',
  password: 'password'
)

User.create!(
  name: 'Rails太郎',
  email: 'rails@sample.jp',
  self_introduction: 'Rails太郎です！！！',
  postal_code: '812-8577',
  prefecture: '福岡県',
  city: '福岡市博多区',
  street: '東公園７−７',
  building: '',
  password: 'password'
)

User.create!(
  name: 'CSS太郎',
  email: 'css@sample.jp',
  self_introduction: 'CSS太郎です！！！',
  postal_code: '540-8570',
  prefecture: '大阪府',
  city: '大阪市',
  street: '中央区大手前2丁目',
  building: '',
  password: 'password'
)

30.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: "sample#{n + 1}@sample.jp",
    self_introduction: Faker::Lorem.paragraph,
    prefecture: '',
    postal_code: '',
    city: '',
    street: '',
    building: '',
    password: 'password'
  )
end

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output
