class User < ActiveRecord::Base
    has_secure_password
  validates :name, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  after_initialize :ensure_session_token

  has_many :api_keys

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

end
