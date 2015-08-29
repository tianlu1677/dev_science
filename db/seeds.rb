# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create_with(username: 'tianlu', password: 'kkb654321', password_confirmation: 'kkb654321', confirmed_at: DateTime.now).find_or_create_by!(:email => '1035232764@qq.com')
