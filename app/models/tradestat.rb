# encoding: UTF-8
class Tradestat < ActiveRecord::Base
	belongs_to :client, class_name: "User", foreign_key: "user_id"
	belongs_to :task
end
