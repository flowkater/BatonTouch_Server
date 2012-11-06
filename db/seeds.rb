# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email:"foobar@foobar.com",password:"foobar",password_confirmation:"foobar")
User.create!(email:"doobar@doobar.com",password:"doobar",password_confirmation:"doobar")

(1..20).each {|x| Task.create!(name: "name #{x}",description:"description #{x}",fromloc:"fromloc #{x}",toloc:"toloc #{x}",spendtime:"spendtime #{x}",calldate:"calldate #{x}",enddate:"enddate #{x}")}

ApiKey.create!