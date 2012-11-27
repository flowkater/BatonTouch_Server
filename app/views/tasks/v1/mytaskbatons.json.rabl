collection @tasks, root: "tasks"

attributes :id, :name, :client_size, :created_at, :status, :category_id

node(:client_status){|task| current_user.client_status}
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