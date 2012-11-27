object @user

attributes :id,:email,:name, :company,:phone,:introduce,:client_status, :provider, :cookie

child @user.reviews => :reviews do
	attributes :id, :star, :content
end

child @user.giftcons => :giftcons do
	attributes :id
	node(:name) {|g| g.giftitem.name }
	node(:image) {|g| g.giftitem.picture_medium }
	node(:price) {|g| g.giftitem.price }
end