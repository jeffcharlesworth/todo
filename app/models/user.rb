class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  attr_accessor :password

  validates :first_name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 100 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 5, maximum: 254 }

  before_create :assign_salt

  def assign_salt
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
