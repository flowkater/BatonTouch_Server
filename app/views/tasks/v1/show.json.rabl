object @task

attributes :id, :name, :fromloc, :toloc, :description, :status, :calldate, :enddate, :day
if current_user
	node(:current_user) do |task|
		if current_user == @task.user || task.check_client(current_user)
			true
		else
			false
		end
	end
end

child @task.giftcons.first => :giftcon do
	attributes :id
	node(:name) {|g| g.giftitem.name }
	node(:image) {|g| g.giftitem.picture_medium }
end

child @task.user => :user do
	attributes :id, :name, :profile_image
	node(:facebook) do |u|
		if u.provider
			true
		else
			false
		end
	end
	node(:phone_auth) do |u|
		if u.phone
			true
		else
			false
		end
	end
end

child @task.to_clientreview => :review do
	attributes :star, :status, :content
end

if @task.status == 0
	child @task.clients => :users do
		attributes :id, :name, :phone, :profile_image
		node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
		node(:facebook) do |u|
			if u.provider
				true
			else
				false
			end
		end
		node(:phone_auth) do |u|
			if u.phone
				true
			else
				false
			end
		end
	end	
else
	child @task.clients => :client do
		attributes :id, :name, :profile_image, :phone
		node(:tradestat_id) { |user| user.task_tradestat(@task.id)}
		node(:facebook) do |u|
			if u.provider
				true
			else
				false
			end
		end
		node(:phone_auth) do |u|
			if u.phone
				true
			else
				false
			end
		end
	end
end

