# encoding: UTF-8
class Review < ActiveRecord::Base
	attr_accessible :content, :star, :user_id, :target_id, :task_id, :status
	belongs_to :task
	belongs_to :user
	belongs_to :targetuser, class_name: "User", foreign_key: "target_id"
end
