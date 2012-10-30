class MainController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	# error 처리 해주어야함
  def check_mobile_login
    #root_path/check_mobile_login?token=FB_MOBILE_TOKEN
    token = params[:token]

    #user object
    user = Koala::Facebook::API.new(token)
    user = user.get_object('me')

    #find_by_uid
    logged = find_or_register_user_uid(user, token)

    #respond authentication_token
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: logged.authentication_token}
    end
  end

  protected

  # uid 를 통해서 찾고 못찾으면 유저 만들기
  def find_or_register_user_uid(user, token)
    logged = User.find_by_uid(user['id'])
    if logged
      logged
    else
      User.create!(email: user['email'],provider: "facebook",uid: user['id'],name: user['name'],oauth_token: token)
    end
  end
end