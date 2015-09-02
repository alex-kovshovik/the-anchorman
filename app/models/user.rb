class User < ActiveRecord::Base
  belongs_to :group

  validates :auth_token, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  before_validation :generate_auth_token

  private

  def generate_auth_token
    return unless self.new_record?

    loop do
      self.auth_token = SecureRandom.hex

      break unless User.exists?(auth_token: self.auth_token)
    end
  end
end
