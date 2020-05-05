class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true, length: { minimum: 8 }

  before_save :lowercase

  def lowercase 
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    lowercase_email = email.strip.downcase
    user = User.find_by_email(lowercase_email)

    if user && user.authenticate(password)
      user
    else
      user = nil
    end
  end
end
