class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private
  def authenticated?
      authenticate_or_request_with_http_basic do |email, password|
      user = User.find_by_email(email)
      encrypted_password = BCrypt::Engine.hash_secret(password, user.password_salt)
      User.where(email: email, password_hash: encrypted_password).present?
    end
  end
end
