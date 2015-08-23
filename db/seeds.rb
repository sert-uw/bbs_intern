# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

200.times do |no|
  thread = BbsThread.create(name: "投稿者 #{no}", address: "test#{no}@test.test", title: "スレッド #{no}", body: "本文 #{no}\nテスト", password: "password#{no}")

  200.times do |res_no|
    thread.responses.create(name: "投稿者 #{res_no}", address: "test#{res_no}@test.test", body: "コメント #{res_no}\nテスト", password: "password#{res_no}")
  end
end
