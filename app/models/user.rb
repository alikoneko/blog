class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_secure_password
  validates :password_confirmation, presence: true, if: lambda { !password.nil? }

  def email=(value)
    super(value.downcase)
  end
end