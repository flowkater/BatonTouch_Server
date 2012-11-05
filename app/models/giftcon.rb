# encoding: UTF-8
class Giftcon < ActiveRecord::Base
	belongs_to :giftconable, polymorphic: true
end
