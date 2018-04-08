class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable, 
          :trackable, :validatable, :authentication_keys => [:username]
  
  has_many :projects

  validates :username, presence: :true, uniqueness: { case_sensitive: false, message: 'This login is already registered. Please, log in.' }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def create_token(client_id: nil, token: nil, expiry: nil, **token_extras)
    client_id ||= SecureRandom.urlsafe_base64(nil, false)
    token     ||= SecureRandom.urlsafe_base64(nil, false)
    expiry    ||= (Time.now + token_lifespan).to_i

    self.tokens[client_id] = {
      token: BCrypt::Password.create(token),
      expiry: expiry
    }.merge!(token_extras)

    [client_id, token, expiry]
  end

  def token_lifespan
    DeviseTokenAuth.token_lifespan
  end
end
