# encoding: UTF-8
class Task < ActiveRecord::Base
	# before_save :default_status
	paginates_per 5
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

	def clients
		tradestats.each {|t| clients << t.client}
	end

	protected

	# status 
	#  0  : 대기중
	#  1  : 진행중
	#  2  : 완료
	#  -1 : 만료
	# ect : Error

	# def default_status
	# 	self.status ||= 0
	# end

  def cookiecreate
    self.cashes.create!
  end
end
