# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(email: "foobar@foobar.com" ,password: "foobar" ,password_confirmation: "foobar",name: "foobar", phone: "010-5103-9639", introduce: "introduce", client_status: false)
# User.create!(email: "doobar@doobar.com" ,password: "doobar" ,password_confirmation: "doobar",name: "doobar", phone: "010-3456-2442", introduce: "introduce", client_status: true)

# Task.create!(name: "집에 데려다 주세요.",description:"집에 좀 데려다 주세요.",fromloc:"이화여대에서",toloc:"부산으로",spendtime:"30시간",calldate:"",enddate:"",user_id: 1)
# Task.create!(name: "우유 사다주세요",description:"우유 좀 많이 사다 주세요. 파스퇴르 우유",fromloc:"대관령 양떼목장에서",toloc:"이화여대로",spendtime:"20분",calldate:"",enddate:"",user_id: 1)
# Task.create!(name: "남자 소개 시켜주세요.",description:"키는 180좀 안되고 직업은 CTO 정도면 될거 같애요.",fromloc:"이화여대",toloc:"이화여대",spendtime:"60분",calldate:"",enddate:"",user_id: 1)
# Task.create!(name: "나 운동 좀 가르쳐주세요.",description:"걍 맨날 구로디지털단지역에서 과로해서 죽을거 같음요. 누가 같이 운동 좀 시켜주세요.",fromloc:"이화여대",toloc:"이화여대",spendtime:"60분",calldate:"",enddate:"",user_id: 2)

# Store.create!(name: "소소한 이야기")
# Store.create!(name: "정희 와플")
# Store.create!(name: "달콤한 코끼리")

# Giftitem.create!(name: "졸라 맛있는 거 1개", description: "졸라 맛있는 거!졸라 맛있는 거!", fromdate: Time.now, todate: Time.now, price: 1000.0, store_id: "1")
# Giftitem.create!(name: "좀 덜 맛있는 거 3개", description: "좀 덜 맛있는 거좀 덜 맛있는 거좀 덜 맛있는 거!", fromdate: Time.now, todate: Time.now, price: 80.0, store_id: "1")
# Giftitem.create!(name: "토할거 같은 거 3개", description: "토할거 같은 거! 토할거 같은 거! 토할거 같은 거!", fromdate: Time.now, todate: Time.now, price: 90.0, store_id: "1")
# Giftitem.create!(name: "먹으면 배째는거 3개", description: "먹으면 배째는거! 먹으면 배째는거! 먹으면 배째는거!", fromdate: Time.now, todate: Time.now, price: 10.0, store_id: "1")
# Giftitem.create!(name: "아 ㅅㅂ 이건 진짜 아닌거 1개", description: "아 ㅅㅂ 이건 진짜 아닌거!", fromdate: Time.now, todate: Time.now, price: 30.0, store_id: "1")
# Giftitem.create!(name: "에이 퉤!", description: "에이 퉤!!!!!!!", fromdate: Time.now, todate: Time.now, price: 60.0, store_id: "1")

# Giftitem.create!(name: "먹으면 배째는거 3개", description: "먹으면 배째는거! 먹으면 배째는거! 먹으면 배째는거!", fromdate: Time.now, todate: Time.now, price: 10.0, store_id: "2")
# Giftitem.create!(name: "아 ㅅㅂ 이건 진짜 아닌거 1개", description: "아 ㅅㅂ 이건 진짜 아닌거!", fromdate: Time.now, todate: Time.now, price: 30.0, store_id: "2")
# Giftitem.create!(name: "에이 퉤!", description: "에이 퉤!!!!!!!", fromdate: Time.now, todate: Time.now, price: 60.0, store_id: "2")

ApiKey.create!
