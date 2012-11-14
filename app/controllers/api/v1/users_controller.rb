class Api::V1::UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_filter :restrict_access
	respond_to :json
	before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])
		# @reviews = @user.reviews
		render 'users/v1/show'
	end

	def user_current
		@user = current_user
		render 'users/v1/show'
	end

	private

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(access_token: token)
		end
	end
end