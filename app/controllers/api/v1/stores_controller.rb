# encoding: UTF-8
class Api::V1::StoresController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	# before_filter :authenticate_user!
	before_filter :restrict_access
	respond_to :json

	def index
		@stores = Store.all
		render "stores/v1/index"
	end

	def show
		@store = Store.find(params[:id])
		render "stores/v1/show"
	end

	private 

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(access_token: token)
		end
	end
end