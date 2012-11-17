# encoding: UTF-8
class Giftcon < ActiveRecord::Base
	before_create :generate_authkey
	belongs_to :client, class_name: "User", foreign_key: "client_id"
	belongs_to :task
	belongs_to :giftitem
 
	private

	def generate_authkey
		begin
			self.authkey = SecureRandom.hex(4)
		end while self.class.exists?(authkey: authkey)
	end
end
