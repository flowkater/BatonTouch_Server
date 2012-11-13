object @task

attributes :id, :name, :fromloc, :toloc, :description, :status, :calldate, :enddate
node(:current_user) do |task|
	if current_user == @user || task.check_client(current_user)
		true
	else
		false
	end
end

child @user => :user do
	attributes :id, :name
end

if @status == 0
	child @clients => :users do
		attributes :id, :name
		node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
	end	
else
	child @clients => :client do
		attributes :id, :name
		node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
	end
end

