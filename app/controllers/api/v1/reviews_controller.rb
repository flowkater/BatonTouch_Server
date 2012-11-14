# encoding: UTF-8
class Api::V1::ReviewsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_filter :restrict_access
	respond_to :json
	def show
		
	end

	def create
		@review = current_user.reviews.build(params[:review])

		if @review.save
			render status: :created, json: {response: "success_created"}
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