class Giftitem < ActiveRecord::Base
	belongs_to :store
	has_many :giftcon
	has_many :pictures, as: :imageable

	def picture
  	if pictures.first.image_url(:thumb)
  		pictures.first.image_url(:thumb)
  	end
  end

  def picture_medium
    if pictures.first.image_url(:medium)
      pictures.first.image_url(:medium)
    end
  end
end
