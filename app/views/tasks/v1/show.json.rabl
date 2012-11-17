object @task

attributes :id, :name, :fromloc, :toloc, :description, :status, :calldate, :enddate
node(:current_user) do |task|
	if current_user == @task.user || task.check_client(current_user)
		true
	else
		false
	end
end

child @task.giftcons.first => :giftcon do
	attributes :id, :authkey, :store_id, :item_id
end

child @task.user => :user do
	attributes :id, :name
end

child @task.reviews => :reviews do
	attributes :star, :status
end

if @task.status == 0
	child @task.clients => :users do
		attributes :id, :name
		node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
	end	
else
	child @task.clients => :client do
		attributes :id, :name
		node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
	end
end

