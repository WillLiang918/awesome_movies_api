class User < ActiveRecord::Base
    has_secure_password
  validates :name, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  after_initialize :ensure_session_token

  has_many :api_keys

  # attr_reader :password
  #
  # def password=(password)
  #   @password = password
  #   self.password_digest = BCrypt::Password.create(password)
  # end
  #
  # def is_password?(password)
  #   BCrypt::Password.new(self.password_digest).is_password?(password)
  # end

  def generate_token
    SecureRandom.urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_token
  end

  def reset_token!
    self.session_token = generate_token
    self.save!
    self.session_token
  end

  # private
  #   def session_api_key
  #     self.session_token.first_or_create
  #   end
end
