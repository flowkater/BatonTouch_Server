class Giftitem < ActiveRecord::Base
	belongs_to :store
	has_many :giftcon
end
