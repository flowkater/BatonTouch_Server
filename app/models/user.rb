# encoding: UTF-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # token 유저 생성시 생성, 기본 cookie 생성
  before_save :ensure_authentication_token
  # after_create :cookiecreate

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider,
    :uid, :name, :oauth_token, :phone, :introduce, :client_status, :cookie, :gcm_regid, :profile_image, :company

  # Task 관계
  has_many :tasks

  # TradeStats (Client 거래 상태)
  has_many :tradestats, foreign_key: "client_id"

  # Cash polymorphic
  # has_many :cashes, as: :cookiable

  # Picture polymorphic
  has_many :pictures, as: :imageable

  # Giftcon Client have
  has_many :giftcons, foreign_key: "client_id"

  # Review
  has_many :reviews

  # Cukilog
  has_many :cukilogs

  def gcm_send(message)
    api_key = "AIzaSyDBXuqBYA5vju-s1WNAjate4llPszHP-zU"
    gcm = GCM.new(api_key)
    registration_ids = []
    registration_ids << gcm_regid
    options = {data: {text: message}, collapse_key: Time.now}
    # options = {data: {score: "123"}, collapse_key: "updated_score"}
    response = gcm.send_notification(registration_ids, options)
  end

  # Profile Picture
  def picture 
    if pictures.first.image_url(:thumb)
      pictures.first.image_url(:thumb)
    end
  end

  # Task create action cookie to Task
  # def cookie_to_task(price)
  #   user_cookie = self.cookie - price.to_f
  #   if user_cookie < 0 #쿠키가 0이하 이면 에러
  #     user_cookie = "error" # 이 때 String을 반납하니 task_create action 에서 error 가 날 것이다.
  #   end
  #   user_cookie # 리턴
  # end

  # cancel cookie back 
  def cookie_back(price)
    cookie + price
  end

  # 내가 비딩한 태스크들
  def bid_tasks
    tradestats.all.map{|t| t.task}
  end

  # User's cookie
  # def cookie
  #   cashes.first.cookie
  # end

  # Task_id 로 해당 클라이언트의 tradestat 아이디 가져오기
  def task_tradestat(task_id)
    begin
      tradestats.find(:first, conditions:{task_id: task_id}).id
    rescue
      nil     
    end
  end

  # 현재 유저의 태스크들을 제외하고 리턴
  def exclusive_current_user_task(alltasks)
    alltasks.reject{|t| tasks.include? t}
  end

  # facebook Koala API 선언
  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end

  # facebook 친구수 불러오기
  def friends_count
    facebook {|fb| fb.get_connection("me","friends").size }
  end

  # omniauth 등록
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  # session 등록
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  # password required? 메서드 조건
  def password_required?
    super && provider.blank?
  end


  # update 패스워드
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  protected

  # def cookiecreate
  #   self.cashes.create!
  # end
end
