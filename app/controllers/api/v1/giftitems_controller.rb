# encoding: UTF-8
class Api::V1::GiftitemsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_filter :authenticate_user!
	before_filter :restrict_access
	respond_to :json
	def index
		
	end

	def show
		@giftitem = Giftitem.find(params[:id])
		render 'giftitems/v1/show'
	end

	def check
		@giftitem = Giftitem.find(params[:id])
		@user_cookie = current_user.cookie
		if @user_cookie >= @giftitem.price
			render 'giftitems/v1/check'
		else
			render status: :unprocessable_entity, json: {response: 'not_enough_cookie'}
		end
	end

	private 

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(access_token: token)
		end
	end
end