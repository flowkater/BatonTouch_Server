# encoding: UTF-8
class Api::V1::GiftitemsController < ApplicationController
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
end