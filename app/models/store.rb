class Store < ActiveRecord::Base
	attr_accessible :name

	has_many :giftitems
	
	# Picture polymorphic
  has_many :pictures, as: :imageable

  def picture
  	if pictures.first.image_url(:thumb)
  		pictures.first.image_url(:thumb)
  	end
  end
end
