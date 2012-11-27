class Api::V1::MainController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	# error 처리 해주어야함
  def check_mobile_login
    #root_path/check_mobile_login?token=FB_MOBILE_TOKEN 
    token = params[:token]
    regid = params[:regid]

    #user object
    user = Koala::Facebook::API.new(token)
    user = user.get_object('me')

    #find_by_uid
    logged = find_or_register_user_uid(user, token, regid)
    # logged = User.find_by_uid(user['id'])

    #respond authentication_token
    render status: 200, json:{session:{error:"Success", auth_token: logged.authentication_token}}
  end

  protected

  # uid 를 통해서 찾고 못찾으면 유저 만들기
  def find_or_register_user_uid(user, token, regid)
    logged = User.find_by_uid(user['id'])
    if logged
      logged
    else
      User.transaction do
        begin
          @user = User.create!(email: user['email'],provider: "facebook",uid: user['id'],name: user['name'],oauth_token: token, profile_image: "http://graph.facebook.com/#{user['id']}/picture?type=large",gcm_regid: regid)
        rescue ActiveRecord::RecordInvalid
          render status: :unprocessable_entity, json: {response: 'error'}
          raise ActiveRecord::Rollback
        end
      end
      @user
    end
  end
end