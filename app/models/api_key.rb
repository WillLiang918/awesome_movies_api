class ApiKey < ActiveRecord::Base
  before_create :generate_access_token
  belongs_to :user

  private
  
    def generate_access_token
      loop do
        self.access_token = SecureRandom.base64
        break unless ApiKey.exists?(access_token: access_token)
      end
    end
end
