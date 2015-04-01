class User < ActiveRecord::Base




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def password_required?
    super && token.blank?
  end

  def self.from_omniauth(auth)
    user = where(auth_params(auth)).first_or_initialize
    if user.new_record?
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
    user.image = auth.info.image
    user.token = auth.credentials.token
    user.expires_at = auth.expires_at

    user.save!
    user
  end
  def self.auth_params(auth)
    params = auth.slice(:uid)
    ActionController::Parameters.new(params).permit(:uid)
  end



end
