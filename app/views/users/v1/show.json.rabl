object @user
attributes :id,:email,:name, :company,:phone,:introduce,:client_status, :provider, :cookie

child @user.reviews => :reviews do
	attributes :id, :star, :content
end

child @user.giftcons => :giftcons do
	attributes :id, :authkey, :store_id, :item_id
end