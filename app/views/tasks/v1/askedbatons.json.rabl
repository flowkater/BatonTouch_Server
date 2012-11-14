collection @tasks, root: "tasks"
attributes :id, :name, :client_size, :status, :day
node(:client_status){|task| current_user.client_status}