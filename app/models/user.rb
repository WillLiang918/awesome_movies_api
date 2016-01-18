class User < ActiveRecord::Base
  :has_secure_password
  has_many :api_keys

  validates :name, :username, :email, presence: true
  validates :username, :email, uniqueness: true

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
    def session_api_key
      api_keys.session.first_or_create
    end
end
