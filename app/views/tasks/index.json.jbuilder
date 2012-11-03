json.tasks @tasks do |json, task|
	json.(task, :id, :name, :description, :status)
	json.day task.created_at
end