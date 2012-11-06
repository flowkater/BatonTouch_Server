module Api
	module V1
		class TradestatsController < ApplicationController
			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
			before_filter :restrict_access
			respond_to :json

			# def index
			# 	@tradestats = Tradestat.all
			# 	render "tradestats/v1/index"
			# end

			def create
				# @client.tradestats.create!(task_id:@task.id)
				@tradestat = Tradestat.new(task_id: params[:task_id])

				if @tradestat.save
					render status: :created, json: @tradestat
				else
					render status: :unprocessable_entity, json: {response:"unprocessable_entity"}
				end
			end

			def destroy
				@tradestat = Tradestat.find(params[:id])
				@tradestat.destroy
				render status: :no_content, json: {response:"destroy_success"}
			end

			def update
				@tradestat = Tradestat.find(params[:id])

				if @tradestat.update_attributes(params[:tradestat])
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