class Giftitem < ActiveRecord::Base
	belongs_to :store
	has_many :giftcon
	has_many :pictures, as: :imageable

	def picture
  	if pictures.first.image_url(:thumb)
  		pictures.first.image_url(:thumb)
  	end
  end
end
