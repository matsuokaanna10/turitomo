# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name: '雑談' },
  { name: '質問' },
  { name: 'メンバー募集' },
  { name: '友達募集' },
  { name: '初心者歓迎' },
  { name: '経験者歓迎' },
  { name: 'ベテラン歓迎' },
])

Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)