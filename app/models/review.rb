# encoding: UTF-8
class Review < ActiveRecord::Base
	belongs_to :task
	belongs_to :user
	belongs_to :targetuser, class_name: "User", foreign_key: "target_id"
end
