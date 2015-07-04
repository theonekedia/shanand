class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # columns
  # t.string   "name",                   default to username, null: false  # for full name 
  #  t.string   "username",               default: "", null: false
  #  t.string   "email",                  default: "", null: false
  #  t.string   "encrypted_password",     default: "", null: false
  #  t.string   "reset_password_token"
  #  t.datetime "reset_password_sent_at"
  #  t.datetime "remember_created_at"
  #  t.integer  "sign_in_count",          default: 0,  null: false
  #  t.datetime "current_sign_in_at"
  #  t.datetime "last_sign_in_at"
  #  t.string   "current_sign_in_ip"
  #  t.string   "last_sign_in_ip"
  #  t.string   "confirmation_token"
  #  t.datetime "confirmed_at"
  #  t.datetime "confirmation_sent_at"
  #  t.string   "unconfirmed_email"
  #  t.integer  "failed_attempts",        default: 0,  null: false
  #  t.string   "unlock_token"
  #  t.datetime "locked_at"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"

  # Add columns
  # gender
  # Occupation
  # Income Group
  # Investment in shares
  # Age
  # Oauth_provider  :default => nil
  # Boolean for posting on Social Site 
  # Level of knowledge (Beginner/intermediate/Expert) # Evaluate based on the score
  # Questionnaire attempted  # boolean
  # portfolio # define as text # store it as array of hashes
  # Premum user  # boolean
  # mobile number
  # mobile verified  # boolean
  # sms subscription
  # date of birth
  # Hometown
  # current timezone
  # picture
  # 







  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable #:confirmable
  has_many :Identities

  TEMP_EMAIL_PREFIX = 'Changeit2getconfirmationmail@shareanand'
  TEMP_EMAIL_REGEX = /\A[^@]+@[^@]+\z/

    def self.find_for_oauth(auth, current_user)

    #authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    #if authorization.user.blank?
    #  user = current_user || User.where('email = ?', auth["info"]["email"]).first

    data = auth.info
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    user = current_user || User.where(:provider => auth.provider, :uid => auth.uid, :email => auth["info"]["email"]).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:auth.provider,
          email: data["email"],
          uid: auth.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
=begin    
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        #user.skip_confirmation!
        user.save!
      end
    end
=end
    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
=begin
def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end
=end