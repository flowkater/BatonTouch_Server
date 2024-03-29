class Picture < ActiveRecord::Base
	attr_accessible :image, :imageable_id, :imageable_type
  belongs_to :imageable, polymorphic: true
  mount_uploader :image, ImageUploader

	validates :image, presence: true  
end
