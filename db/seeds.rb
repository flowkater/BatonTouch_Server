# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "foobar@foobar.com" ,password: "foobar" ,password_confirmation: "foobar",name: "foobar", phone: "010-5103-9639", introduce:"introduce", client_status: false)
User.create!(email: "doobar@doobar.com" ,password: "doobar" ,password_confirmation: "doobar",name: "doobar", phone: "010-3456-2442", introduce:"introduce", client_status: true)

Task.create!(name: "집에 데려다 주세요.",description:"집에 좀 데려다 주세요.",fromloc:"이화여대에서",toloc:"부산으로",spendtime:"30시간",calldate:"",enddate:"",user_id: 1)
Task.create!(name: "우유 사다주세요",description:"우유 좀 많이 사다 주세요. 파스퇴르 우유",fromloc:"대관령 양떼목장에서",toloc:"이화여대로",spendtime:"20분",calldate:"",enddate:"",user_id: 1)
Task.create!(name: "남자 소개 시켜주세요.",description:"키는 180좀 안되고 직업은 CTO 정도면 될거 같애요.",fromloc:"이화여대",toloc:"이화여대",spendtime:"60분",calldate:"",enddate:"",user_id: 1)

ApiKey.create!
