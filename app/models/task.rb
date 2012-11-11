# encoding: UTF-8
class Task < ActiveRecord::Base
	# before_save :default_status
	paginates_per 7
	after_create :cookiecreate

	# User 귀속
	belongs_to :user

	# Client Status
	has_many :tradestats, dependent: :destroy

	# Cash polymorphic
	has_many :cashes, as: :cookiable

	# Giftcon polymorphic
  has_many :giftcons, as: :giftconable

	# Task's cookie
	def cookie
		cashes.first.cookie
	end

	# Current Task's 클라이언트
	def clients
		tradestats.all.map{|t| t.client}
	end

	# Task's 선택된 클라이언트 호출
	def select_client
		tradestats.collect{|t| t.client if t.status == true}.first
	end

	def check_client(current_user)
		clients
	end

	# 현재 태스크에 비딩한 클라이언트 수
	def client_size
		tradestats.size
	end

	# 유저 정보로 해당되는 tradestat 아이디 가져오기
	def client_tradestat(client_id)
		tradestats.find(:first, conditions:{client_id: client_id}).id
	end

	protected

	# status 
	#  0  : 대기중
	#  1  : 진행중
	#  2  : 완료
	#  3  : Task 완료 -- 2, 3 똑같은 완료 상태
	#  -1 : 만료
	# ect : Error

	# def default_status
	# 	self.status ||= 0
	# end

  def cookiecreate
    self.cashes.create!
  end
end
