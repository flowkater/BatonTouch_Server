object @store
attributes :id, :name

child @store.giftitems => :giftitems do 
	attributes :id, :name, :description, :fromdate, :todate, :price
	node(:image) {|g| g.picture}
end
