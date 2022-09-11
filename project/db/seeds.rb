# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:email => "18000000@buaa.edu.cn", :password => "123456", :password_confirmation => "123456",
            :user_role => 1, :user_name => "admin",:phone => "18888888888")
User.create(:email => "buaa@buaa.edu.cn", :password => "123456", :password_confirmation => "123456",
            :user_role => 0, :user_name => "test_customer",:phone => "18211837465")