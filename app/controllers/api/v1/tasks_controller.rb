module Api
	module V1
		class TasksController < ApplicationController
			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
			before_filter :restrict_access
			respond_to :json

			def index
				@tasks = Task.page(params[:page])
				render "tasks/v1/index"
			end

			def show
				@task = Task.find(params[:id])
				render "tasks/v1/show"
			end

			def update
				@task = Task.find(params[:id])

				if @task.update_attributes(params[:task])
					render status: :no_content, json: 'update_success'
				else
					render status: :unprocessable_entity, json: 'update_error'
				end
			end

			private 

			def restrict_access
				authenticate_or_request_with_http_token do |token, options|
					ApiKey.exists?(access_token: token)
				end
			end
		end
	end
end