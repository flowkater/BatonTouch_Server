# encoding: UTF-8
class Tradestat < ActiveRecord::Base
	attr_accessible :status, :task_id
	belongs_to :client, class_name: "User", foreign_key: "client_id"
	belongs_to :task

	def is_selected
		status = true
		save!
	end

	def exist_tradestat
		
	end
end
