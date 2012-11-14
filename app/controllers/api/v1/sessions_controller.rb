# encoding: UTF-8
class Api::V1::SessionsController < Devise::SessionsController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_filter :restrict_access
	respond_to :json

	def create
		warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
		render status: 200, json:{session:{error:"Success", auth_token: current_user.authentication_token, client_status: current_user.client_status}}
	end

	def destroy
		warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")	
		current_user.authentication_token = nil
		render json: {}.to_json, status: :ok
	end

	private 

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(access_token: token)
		end
	end
end	
