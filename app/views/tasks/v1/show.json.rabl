object @task

attributes :id, :name, :fromloc, :toloc, :description, :status, :calldate, :enddate

child @task.clients => :users do
	attributes :id, :name
	node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
end
