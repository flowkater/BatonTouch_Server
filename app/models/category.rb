class Category < ActiveRecord::Base
	# Category - Task
	has_many :categorizations
	has_many :tasks, through: :categorizations
end
