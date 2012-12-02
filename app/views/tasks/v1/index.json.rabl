collection @tasks, root: "tasks"

attributes :id, :name, :description, :status, :day, :resttime

node(:review_toclient) do |task|
	if task.review_exist(0)
		true
	else
		false
	end
end

node(:review_touser) do |task|
	if task.review_exist(1)
		true
	else
		false
	end
end

child :user do |task|
	node(:id) {|u| u.id}
	node(:name) {|u| u.name}
	node(:profile_image){|u|u.profile_image}
end

child :giftcon do |task|
	node(:image) {|g| g.giftitem.picture}
end
