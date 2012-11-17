# encoding: UTF-8
class Api::V1::ReviewsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_filter :restrict_access
	before_filter :authenticate_user!
	respond_to :json

	def show
		@review = Review.find(params[:id])
	end

	# User 가 클라이언트에게 리뷰..
	def create
		@review = current_user.reviews.build(params[:review])

		if @review.save
			render status: :created, json: {response: "success_created"}
		else
			render status: :unprocessable_entity, json: {response: 'error'}
		end
	end

	# Client 가 User에게 리뷰...
	def create_by_client
		@review = current_user.reviews.build(params[:review])
		@task = Task.find(params[:task_id])
		@giftcon = @task.giftcons.first

		if @giftcon.update_attributes(client_id: current_user.id) && @review.save
			render status: :created, json: {response: "review & success"}
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