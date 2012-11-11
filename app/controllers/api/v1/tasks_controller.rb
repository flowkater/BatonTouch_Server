# encoding: UTF-8
class Api::V1::TasksController < ApplicationController
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

	def create
		@task = current_user.tasks.build(params[:task])

		if @task.save
			render status: :created, json: {response: "success_create"}
		else
			render status: :unprocessable_entity, json: {response: 'error'}
		end
	end

	def update
		@task = Task.find(params[:id])

		if @task.update_attributes(params[:task])
			render status: :no_content, json: {response: 'update_success'}
		else
			render status: :unprocessable_entity, json: {response: 'update_error'}
		end
	end

	def askedbatons
		@tasks = current_user.tasks	
		render "tasks/v1/askedbatons"
	end

	def mytaskbatons
		@tasks = current_user.bid_tasks
		render "tasks/v1/mytaskbatons"
	end

	# Select Put action
	def selectclient
		@task = Task.find(params[:id])
		@tradestat = Tradestat.find(params[:tradestat_id])
		@task.status = 1

		if @task.save && @tradestat.is_selected
			render status: :ok, json: {response: 'select_success'}
		else
			render status: :unprocessable_entity, json: {response: 'error'}
		end
	end

	private 

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(access_token: token)
		end
	end
end
